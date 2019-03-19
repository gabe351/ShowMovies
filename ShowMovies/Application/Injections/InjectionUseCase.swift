//
//  InjectionUseCase.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 19/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

public func provideGetMovies() -> GetMovies {
    let repository = provideMovieRepository()
    return GetMovies(repository: repository)
}

public func provideGetGenres() -> GetGenres {
    let repository = provideGenreRepository()
    return GetGenres(repository: repository)
}
