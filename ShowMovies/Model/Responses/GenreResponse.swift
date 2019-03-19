//
//  GenreResponse.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 19/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation
import ObjectMapper

public class GenreResponse: NSObject, Mappable {
    
    var id: Int?
    var name: String?
    
    override init() {
        super.init()
    }
    
    convenience required public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        id   <- map[APIFieldEnum.id.rawValue]
        name <- map[APIFieldEnum.name.rawValue]
    }
}

