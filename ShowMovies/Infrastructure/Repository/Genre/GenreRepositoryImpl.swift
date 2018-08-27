//
//  GenreRepositoryImpl.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 26/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

public class GenreRepositoryImpl: GenreRepository {
    
    private static var INSTANCE: GenreRepositoryImpl?
    
    private weak var remoteDataSource: GenreRemoteDataSource?
    private weak var localDataSource: GenreLocalDataSource?
    
    private init(remoteDataSource: GenreRemoteDataSource,
                 localDataSource: GenreLocalDataSource) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource  = localDataSource
    }
    
    public static func getInstance(remoteDataSource: GenreRemoteDataSource,
                                   localDataSource: GenreLocalDataSource) -> GenreRepositoryImpl {
        
        if INSTANCE == nil {
            INSTANCE = GenreRepositoryImpl(remoteDataSource: remoteDataSource,
                                           localDataSource: localDataSource)
        }
        
        return INSTANCE!
    }
    
    public static func destroyInstance(){
        INSTANCE = nil
    }
    
    public func allGenres(_ loadCallback: @escaping (BaseCallback<[Genre]>) -> Void) {
        remoteDataSource?.allGenres(loadCallback)
    }
    
    public func save(genre: Genre) {
        localDataSource?.save(genre: genre)
    }
    
    public func findGenreNameBy(id: Int) -> String {
        guard let genreLocalDataSource = localDataSource else {
            return ""
        }
        
        return genreLocalDataSource.findGenreNameBy(id: id)
    }
}
