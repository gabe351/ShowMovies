//
//  MovieDetailPresenter.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 18/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class MovieDetailPresenter: MovieDetailPresenterContract {
    
    private let view: MovieDetailViewContract
    private let getMovie: GetMovies
    
    init(view: MovieDetailViewContract, getMovie: GetMovies) {
        self.view     = view
        self.getMovie = getMovie
    }
    
    func loadMovieDetail(id: Int) {
        view.showLoader()
        getMovie.movieDetail(id: id) { (callback) in
            callback.onSuccess{ (movieDetail) in
                self.view.hideLoader()
                self.view.show(detail: movieDetail)
            }

            callback.onFailed{ (error) in
                self.view.hideLoader()
                self.view.onError()
            }
        }
    }
}


