//
//  MovieRemoteDataSource.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 19/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

public protocol MovieRemoteDataSource: class {
    
    func searchMovieBy(query: String, page: Int, _ loadCallback: @escaping (BaseCallback<BaseMovie>) -> Void)
    
    func allReleasesBy(page: Int, _ loadCallback: @escaping (BaseCallback<BaseMovie>) -> Void)
    
    func movieDetail(id: Int, _ loadCallback: @escaping (BaseCallback<MovieDetail>) -> Void)
}
