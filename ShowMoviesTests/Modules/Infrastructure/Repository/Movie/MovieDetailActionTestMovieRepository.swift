//
//  MovieDetailActionTest.swift
//  ShowMoviesTests
//
//  Created by Gabriel Rosa on 23/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Quick
import Nimble
@testable import ShowMovies
/**
 Unit tests for the implementation of {@link MovieRepositoryImpl}
 */
class MovieDetailActionTestMovieRepository: QuickSpec {
    override func spec() {
        
        let remoteDataSource = MovieRemoteDataSourceMock()
        var repository: MovieRepository?
        
        beforeEach {
            MovieRepositoryImpl.destroyInstance()
            
            repository = MovieRepositoryImpl.getInstance(remoteDataSource: remoteDataSource)
        }
        
        describe("#movieDetail") {
            let id     = 1
            let action   = "movieDetail"
            let expected = [id.description]
            
            context("When call movieDetail") {
                
                beforeEach {
                    repository?.movieDetail(id: id) { _ in }
                }
                
                it("Should call movieDetail on remote data source") {
                    expect(remoteDataSource.parameters(forAction: action)).to(equal(expected))
                }
            }
        }
        
    }
}

