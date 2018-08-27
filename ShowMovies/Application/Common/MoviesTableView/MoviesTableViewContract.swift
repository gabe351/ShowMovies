//
//  MoviesCollectionViewContract.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 18/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol MoviesTableViewContract: class {
    func request(nextPage: Int)
    func goToDetail(id: Int)
    func getGenreTitlesBy(ids: [Int]) -> String
}
