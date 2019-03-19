//
//  ReleasesContract.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 18/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol ReleasesViewContract: class {
    func show(baseMovie: BaseMovie)
    func emptyList()
    func onError(error: Any)
    func showLoader()
    func hideLoader()
}

protocol ReleasesPresenterContract {
    func loadReleases(page: Int)
    func loadAndSaveGenres()
    func getGenreTitlesBy(ids: [Int]) -> String
}

