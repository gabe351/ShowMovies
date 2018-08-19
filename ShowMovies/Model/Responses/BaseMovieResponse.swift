//
//  BaseMovieResponse.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 19/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation
import ObjectMapper

public class BaseMoviesResponse: NSObject, Mappable {
    
    var page: Int?
    var totalResults: Int?
    var totalPages: Int?
    var results: [MovieResponse]?
    
    override init() {
        super.init()
    }
    
    convenience required public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        
        page         <- map[APIField.page]
        totalResults <- map[APIField.totalResults]
        totalPages   <- map[APIField.totalPages]
        results      <- map[APIField.results]
    }
    
    private struct APIField {
        
        static let page         = "page"
        static let totalResults = "total_results"
        static let totalPages   = "total_pages"
        static let results      = "results"
    }
}

