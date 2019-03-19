//
//  SearchMovieContract.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 18/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol SearchMovieViewContract: class {
    func show(baseMovie: BaseMovie)
    func emptyList()
    func onError()
    func showLoader()
    func hideLoader()
}

protocol SearchMoviePresenterContract {
    func findMovie(page: Int, query: String)
    func getGenreTitlesBy(ids: [Int]) -> String
}

