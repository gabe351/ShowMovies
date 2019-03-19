//
//  BaseMovieConverter.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 21/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

public func convertBaseMovieResponseToEntity(response: BaseMoviesResponse) -> BaseMovie {
    
    var foundMovies = [Movie]()
    
    if let movies = response.results {
        foundMovies = convertMoviesResponsesToEntities(responses: movies)
    }
    
    return BaseMovie(page: defaultIntIfNil(response.page),
                     totalResults: defaultIntIfNil(response.totalResults),
                     totalPages: defaultIntIfNil(response.totalPages),
                     movies: foundMovies)    
}
