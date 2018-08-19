//
//  ReleasesPresenter.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 19/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class ReleasesPresenter: ReleasesPresenterContract {
    
    private weak var view: ReleasesViewContract?
    private let getMovie: GetMovies
    
    init(view: ReleasesViewContract, getMovie: GetMovies) {
        self.view     = view
        self.getMovie = getMovie
    }
    
    func loadReleases(page: Int) {
        self.view?.showLoader()
        getMovie.allReleasesBy(page: page) { (callback) in
            callback.onSuccess{ [unowned self] movies in
                self.view?.show(movies: movies)
                self.view?.hideLoader()
            }
            
            callback.onEmptyData { [unowned self] in
                self.view?.emptyList()
                self.view?.hideLoader()
            }
            
            callback.onFailed{ [unowned self] error in
                self.view?.onError(error: error ?? "")
                self.view?.hideLoader()
            }
        }
    }
}

