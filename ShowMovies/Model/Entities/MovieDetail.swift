//
//  MovieDetail.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 18/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

public struct MovieDetail {
    
    let id: Int
    let title: String
    let originalTitle: String
    let voteAverage: Float
    let posterPath: String
    let backdropPath: String
    let overview: String
    let genres: [Genre]
    let runtime: Int
    let releaseDate: String
    
}
