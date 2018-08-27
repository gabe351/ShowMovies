//
//  GenreRemoteDataSourceImpl.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 26/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

public class GenreRemoteDataSourceImpl: GenreRemoteDataSource {
    
    private static var INSTANCE: GenreRemoteDataSourceImpl?
    private weak var apiDataSource: GenreApiDataSource?
    
    private init(apiDataSource: GenreApiDataSource) {
        self.apiDataSource = apiDataSource
    }
    
    public static func getInstance(apiDataSource: GenreApiDataSource) -> GenreRemoteDataSourceImpl {
        if (INSTANCE == nil) {
            INSTANCE = GenreRemoteDataSourceImpl(apiDataSource: apiDataSource)
        }
        
        return INSTANCE!
    }
    
    public static func destroyInstance() {
        INSTANCE = nil
    }
    
    public func allGenres(_ loadCallback: @escaping (BaseCallback<[Genre]>) -> Void) {
        apiDataSource?.allGenres(loadCallback)
    }
}
