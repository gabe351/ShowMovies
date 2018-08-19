//
//  SearchMovieContract.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 18/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol SearchMovieViewContract: class {
    func show(movies: [Movie])
    func emptyList()
    func onError()
    func showLoader()
    func hideLoader()
}

protocol SearchMoviePresenterContract {
    func findMovie(page: Int, query: String)
}

