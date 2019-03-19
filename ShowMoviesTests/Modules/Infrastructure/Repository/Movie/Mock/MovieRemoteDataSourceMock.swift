//
//  MovieRemoteDataSourceMock.swift
//  ShowMoviesTests
//
//  Created by Gabriel Rosa on 23/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation
@testable import ShowMovies

class MovieRemoteDataSourceMock: MovieRemoteDataSource, DoubleBlockWithNoReturnProtocol, DoubleParametersProtocol {
    
    var doubleParameters: DoubleParameters?
    var doubleBlockWithNoReturn: DoubleBlockWithNoReturn?
    
    func searchMovieBy(query: String, page: Int, _ loadCallback: @escaping (BaseCallback<BaseMovie>) -> Void) {
        let action     = "searchMovieBy"
        let parameters = [query, page.description]
        
        doubleBlockWithNoReturn?.runBlockWithNoReturn(forAction: action)
        doubleParameters = buildDoubleParameters(forAction: action, parameters: parameters)
    }
    
    func allReleasesBy(page: Int, _ loadCallback: @escaping (BaseCallback<BaseMovie>) -> Void) {
        let action     = "allReleasesBy"
        let parameters = [page.description]
        
        doubleBlockWithNoReturn?.runBlockWithNoReturn(forAction: action)
        doubleParameters = buildDoubleParameters(forAction: action, parameters: parameters)
    }
    
    func movieDetail(id: Int, _ loadCallback: @escaping (BaseCallback<MovieDetail>) -> Void) {
        let action     = "movieDetail"
        let parameters = [id.description]
        
        doubleBlockWithNoReturn?.runBlockWithNoReturn(forAction: action)
        doubleParameters = buildDoubleParameters(forAction: action, parameters: parameters)
    }
}
