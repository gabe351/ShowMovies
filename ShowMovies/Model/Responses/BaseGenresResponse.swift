//
//  BaseGenreResponse.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 26/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation
import ObjectMapper

public class BaseGenresResponse: NSObject, Mappable {
    
    var genres: [GenreResponse]?
    
    override init() {
        super.init()
    }
    
    convenience required public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        genres <- map[APIFieldEnum.genres.rawValue]
    }
}
