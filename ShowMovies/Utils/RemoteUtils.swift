//
//  RemoteUtils.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 18/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class RemoteUtils {
    
    private static let BASE_URL = "https://api.themoviedb.org/3/"
    
    static func buildUrl(path: String) -> String {
        return "\(BASE_URL)\(path)"
    }
    
    static func buildImageUrl(path: String) -> String {
        return "https://image.tmdb.org/t/p/w600_and_h900_bestv2\(path)"
    }
}
