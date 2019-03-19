//
//  ReleasesPresenter.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 19/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class ReleasesPresenter: ReleasesPresenterContract {
    
    private unowned var view: ReleasesViewContract
    private let getMovie: GetMovies
    private let getGenres: GetGenres
    
    init(view: ReleasesViewContract, getMovie: GetMovies, getGenres: GetGenres) {
        self.view      = view
        self.getMovie  = getMovie
        self.getGenres = getGenres
    }
    
    func loadReleases(page: Int) {
        self.view.showLoader()
        getMovie.allReleasesBy(page: page) { (callback) in
            callback.onSuccess{ [unowned self] movies in
                self.view.show(baseMovie: movies)
                self.view.hideLoader()
            }
            
            callback.onEmptyData { [unowned self] in
                self.view.emptyList()
                self.view.hideLoader()
            }
            
            callback.onFailed{ [unowned self] error in
                self.view.onError(error: error ?? "")
                self.view.hideLoader()
            }
        }
    }
    
    func loadAndSaveGenres() {
        getGenres.allGenres { (genresCallback) in
            genresCallback.onSuccess() { [weak self] genres in
                genres.forEach() {
                    self?.getGenres.save(genre: $0)
                }
            }
        }
    }
    
    func getGenreTitlesBy(ids: [Int]) -> String {
        return getGenres.findGenresNameBy(ids: ids)
    }
}

