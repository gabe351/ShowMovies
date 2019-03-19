//
//  MovieResponse.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 19/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation
import ObjectMapper

public class MovieResponse: NSObject, Mappable {
    
    var id: Int?
    var title: String?
    var originalTitle: String?
    var voteAverage: Float?
    var posterPath: String?
    var releaseDate: String?
    var genreIds: [Int]?
    
    
    override init() {
        super.init()
    }
    
    convenience required public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        id            <- map[APIFieldEnum.id.rawValue]
        title         <- map[APIFieldEnum.title.rawValue]
        originalTitle <- map[APIFieldEnum.originalTitle.rawValue]
        voteAverage   <- map[APIFieldEnum.voteAverage.rawValue]
        posterPath    <- map[APIFieldEnum.posterPath.rawValue]
        releaseDate   <- map[APIFieldEnum.releaseDate.rawValue]
        genreIds      <- map[APIFieldEnum.genreIds.rawValue]
    }        
}

