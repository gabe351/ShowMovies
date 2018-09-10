//
//  APIFieldEnum.swift
//  ShowMovies
//
//  Created by StantMBP on 10/09/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

enum APIFieldEnum: String {
    case id            = "id"
    case title         = "title"
    case name          = "name"
    case originalTitle = "original_title"
    case voteAverage   = "vote_average"
    case posterPath    = "poster_path"
    case releaseDate   = "release_date"
    case genreIds      = "genre_ids"
    case genres        = "genres"
    case page          = "page"
    case totalResults  = "total_results"
    case totalPages    = "total_pages"
    case results       = "results"
    case backdropPath  = "backdrop_path"
    case overview      = "overview"
    case runtime       = "runtime"         
}
