//
//  MovieDetailContract.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 18/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol MovieDetailViewContract {
    func show(detail: MovieDetail)
    func onError()
    func showLoader()
    func hideLoader()
}

protocol MovieDetailPresenterContract {
    func loadMovieDetail(id: Int)
}
