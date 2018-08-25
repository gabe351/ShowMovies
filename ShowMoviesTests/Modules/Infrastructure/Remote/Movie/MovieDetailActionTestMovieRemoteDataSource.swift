//
//  MovieDetailActionTestMovieRemoteDataSource.swift
//  ShowMoviesTests
//
//  Created by Gabriel Rosa on 25/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Quick
import Nimble
@testable import ShowMovies
/**
 Unit tests for the implementation of {@link MovieRemoteDataSourceImpl}
 */
class MovieDetailActionTestMovieRemoteDataSource: QuickSpec {
    override func spec() {
        
        let apiDataSource = MovieApiDataSourceMock()
        var remoteDataSource: MovieRemoteDataSource?
        
        beforeEach {
            MovieRemoteDataSourceImpl.destroyInstance()
            
            remoteDataSource = MovieRemoteDataSourceImpl.getInstance(apiDataSource: apiDataSource)
        }
        
        describe("#movieDetail") {
            let id     = 1
            let action   = "movieDetail"
            let expected = [id.description]
            
            context("When call movieDetail") {
                
                beforeEach {
                    remoteDataSource?
                        .movieDetail(id: id) { _ in }
                }
                
                it("Should call movieDetail on api data source") {
                    expect(apiDataSource.parameters(forAction: action)).to(equal(expected))
                }
            }
        }
    }
}


