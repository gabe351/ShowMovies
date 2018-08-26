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
    
    
    let emptyOverviewText = "Unfortunately we do not have overview for this movie."
    var foundGenres       = [Genre]()
    let id                = defaultIntIfNil(response.id)
    let title             = defaultStringIfNil(response.title)
    let originalTitle     = defaultStringIfNil(response.originalTitle)
    let voteAverange      = defaultFloatIfNil(response.voteAverage)
    let posterPath        = defaultStringIfNil(response.posterPath)
    let backdropPath      = defaultStringIfNil(response.backdropPath)
    let runtime           = defaultIntIfNil(response.runtime)
    let releaseDate       = defaultStringIfNil(response.releaseDate)
    var overview          = defaultStringIfNil(response.overview)
    
    if overview.isEmpty { overview = emptyOverviewText }
    
    if let genres = response.genres {
        foundGenres = convertGenresResponsesToEntities(responses: genres)
    }
    
    return MovieDetail(id: id,
                       title: title,
                       originalTitle: originalTitle,
                       voteAverage: voteAverange,
                       posterPath: posterPath,
                       backdropPath: backdropPath,
                       overview: overview,
                       genres: foundGenres,
                       runtime: runtime,
                       releaseDate: releaseDate)
}
