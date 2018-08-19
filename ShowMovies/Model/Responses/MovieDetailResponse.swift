//
//  MovieDetailResponse.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 19/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation
import ObjectMapper

public class MovieDetailResponse: NSObject, Mappable {
    
    var id: Int?
    var title: String?
    var originalTitle: String?
    var voteAverage: Float?
    var posterPath: String?
    var backdropPath: String?
    var overview: String?
    var genres: [GenreResponse]?
    var runtime: Int?
    var releaseDate: String?
    
    override init() {
        super.init()
    }
    
    convenience required public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        id            <- map[APIField.id]
        title         <- map[APIField.title]
        originalTitle <- map[APIField.originalTitle]
        voteAverage   <- map[APIField.voteAverage]
        posterPath    <- map[APIField.posterPath]
        backdropPath  <- map[APIField.backdropPath]
        overview      <- map[APIField.overview]
        genres        <- map[APIField.genres]
        runtime       <- map[APIField.runtime]
        releaseDate   <- map[APIField.releaseDate]
    }
    
    private struct APIField {
        
        static let id            = "id"
        static let title         = "title"
        static let originalTitle = "original_title"
        static let voteAverage   = "vote_average"
        static let posterPath    = "poster_path"
        static let backdropPath  = "backdrop_path"
        static let overview      = "overview"
        static let genres        = "genres"
        static let runtime       = "runtime"
        static let releaseDate   = "release_date"
    }
}

