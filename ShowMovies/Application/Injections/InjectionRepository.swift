//
//  InjectionRepository.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 19/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

public func provideMovieRepository() -> MovieRepository {
    let remoteDataSource = provideMovieRemoteDataSource()
    return MovieRepositoryImpl.getInstance(remoteDataSource: remoteDataSource)
}

public func provideGenreRepository() -> GenreRepository {
    let localDataSource  = provideGenreLocalDataSource()
    let remoteDataSource = provideGenreRemoteDataSource()
    return GenreRepositoryImpl.getInstance(remoteDataSource: remoteDataSource,
                                           localDataSource: localDataSource)
}
