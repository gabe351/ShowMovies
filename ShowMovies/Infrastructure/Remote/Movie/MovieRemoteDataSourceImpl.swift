//
//  MovieRemoteDataSourceImpl.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 19/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

public class MovieRemoteDataSourceImpl: MovieRemoteDataSource {
    
    private static var INSTANCE: MovieRemoteDataSourceImpl?    
    private weak var apiDataSource: MovieApiDataSource?
    
    private init(apiDataSource: MovieApiDataSource) {
        self.apiDataSource = apiDataSource
    }
    
    public static func getInstance(apiDataSource: MovieApiDataSource) -> MovieRemoteDataSourceImpl {
        if (INSTANCE == nil) {
            INSTANCE = MovieRemoteDataSourceImpl(apiDataSource: apiDataSource)
        }
        
        return INSTANCE!
    }
    
    public static func destroyInstance() {
        INSTANCE = nil
    }
    
    public func searchMovieBy(query: String, page: Int, _ loadCallback: @escaping (BaseCallback<[Movie]>) -> Void) {
        apiDataSource?.searchMovieBy(query: query, page: page, loadCallback)
    }
    
    public func allReleasesBy(page: Int, _ loadCallback: @escaping (BaseCallback<BaseMovie>) -> Void) {
        apiDataSource?.allReleasesBy(page: page, loadCallback)
    }
    
    public func movieDetail(id: Int, _ loadCallback: @escaping (BaseCallback<MovieDetail>) -> Void) {
        apiDataSource?.movieDetail(id: id, loadCallback)
    }
}

