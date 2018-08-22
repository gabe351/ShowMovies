//
//  BaseMovie.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 21/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

public struct BaseMovie {
    var page: Int
    var totalResults: Int
    var totalPages: Int
    var movies: [Movie]
}
