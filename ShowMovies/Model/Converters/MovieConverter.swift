//
//  MovieConverter.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 19/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

public func convertMovieResponseToEntity(response: MovieResponse) -> Movie {
    
    return Movie(id: defaultIntIfNil(response.id),
                 title: defaultStringIfNil(response.title),
                 originalTitle: defaultStringIfNil(response.originalTitle),
                 voteAverage: defaultFloatIfNil(response.voteAverage),
                 posterPath: defaultStringIfNil(response.posterPath),
                 releaseDate: defaultStringIfNil(response.releaseDate))
}

public func convertMoviesResponsesToEntities(responses: [MovieResponse]) -> [Movie] {
    
    var movies = [Movie]()
    
    responses.forEach {
        let entity = convertMovieResponseToEntity(response: $0)
        movies.append(entity)
    }
    
    return movies
}

public func convertMovieDetailResponseToEntity(response: MovieDetailResponse) -> MovieDetail {
    
    var foundGenres = [Genre]()
    
    if let genres = response.genres {
        foundGenres = convertGenresResponsesToEntities(responses: genres)
    }
    
    return MovieDetail(id: defaultIntIfNil(response.id),
                       title: defaultStringIfNil(response.title),
                       originalTitle: defaultStringIfNil(response.originalTitle),
                       voteAverage: defaultFloatIfNil(response.voteAverage),
                       posterPath: defaultStringIfNil(response.posterPath),
                       backdropPath: defaultStringIfNil(response.backdropPath),
                       overview: defaultStringIfNil(response.overview),
                       genres: foundGenres,
                       runtime: defaultIntIfNil(response.runtime),
                       releaseDate: defaultStringIfNil(response.releaseDate))
}
