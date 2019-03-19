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
        page         <- map[APIFieldEnum.page.rawValue]
        totalResults <- map[APIFieldEnum.totalResults.rawValue]
        totalPages   <- map[APIFieldEnum.totalPages.rawValue]
        results      <- map[APIFieldEnum.results.rawValue]
    }
}

