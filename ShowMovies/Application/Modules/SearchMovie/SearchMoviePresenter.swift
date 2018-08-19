//
//  SearchMoviePresenter.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 19/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class SearchMoviePresenter: SearchMoviePresenterContract {
    
    private weak var view: SearchMovieViewContract?
    private let getMovie: GetMovies
    
    init(view: SearchMovieViewContract, getMovie: GetMovies) {
        self.view     = view
        self.getMovie = getMovie
    }
    
    func findMovie(page: Int, query: String) {
        view?.showLoader()
        getMovie.searchMovieBy(query: query, page: page) { (useCaseCallback) in
            useCaseCallback.onSuccess { [unowned self] movie in
                self.view?.hideLoader()
                self.view?.show(movies: movie)
            }
            
            useCaseCallback.onEmptyData { [unowned self] in
                self.view?.hideLoader()
                self.view?.emptyList()
            }
            
            useCaseCallback.onFailed{ [unowned self] error in
                self.view?.hideLoader()
                self.view?.onError()
            }
        }
    }
}

