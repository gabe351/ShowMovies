//
//  MovieRepositoryImpl.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 19/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

public class MovieRepositoryImpl: MovieRepository {
    
    private static var INSTANCE: MovieRepositoryImpl?
    
    private weak var remoteDataSource: MovieRemoteDataSource?
    
    private init(remoteDataSource: MovieRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    public static func getInstance(remoteDataSource: MovieRemoteDataSource) -> MovieRepositoryImpl {
        
        if INSTANCE == nil {
            INSTANCE = MovieRepositoryImpl(remoteDataSource: remoteDataSource)
        }
        
        return INSTANCE!
    }
    
    public static func destroyInstance(){
        INSTANCE = nil
    }
    
    public func searchMovieBy(query: String, page: Int, _ loadCallback: @escaping (BaseCallback<[Movie]>) -> Void) {
        remoteDataSource?.searchMovieBy(query: query, page: page, loadCallback)
    }
    
    public func allReleasesBy(page: Int, _ loadCallback: @escaping (BaseCallback<BaseMovie>) -> Void) {
        remoteDataSource?.allReleasesBy(page: page, loadCallback)
    }
    
    public func movieDetail(id: Int, _ loadCallback: @escaping (BaseCallback<MovieDetail>) -> Void) {
        remoteDataSource?.movieDetail(id: id, loadCallback)
    }
}

