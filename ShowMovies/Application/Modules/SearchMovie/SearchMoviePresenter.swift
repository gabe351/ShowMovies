//
//  SearchMoviePresenter.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 19/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class SearchMoviePresenter: SearchMoviePresenterContract {
    
    private unowned var view: SearchMovieViewContract
    private let getMovie: GetMovies
    private let getGenre: GetGenres
    
    init(view: SearchMovieViewContract,
         getMovie: GetMovies,
         getGenre: GetGenres) {
        self.view     = view
        self.getMovie = getMovie
        self.getGenre = getGenre
    }
    
    func findMovie(page: Int, query: String) {
        view.showLoader()
        getMovie.searchMovieBy(query: query, page: page) { (useCaseCallback) in
            useCaseCallback.onSuccess { [unowned self] baseMovie in
                self.view.hideLoader()
                self.view.show(baseMovie: baseMovie)
            }
            
            useCaseCallback.onEmptyData { [unowned self] in
                self.view.hideLoader()
                self.view.emptyList()
            }
            
            useCaseCallback.onFailed{ [unowned self] error in
                self.view.hideLoader()
                self.view.onError()
            }
        }
    }
    
    func getGenreTitlesBy(ids: [Int]) -> String {
        return getGenre.findGenresNameBy(ids: ids)
    }
}

