//
//  AllReleasesByActionTestRemoteDataSource.swift
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
class AllReleasesByActionTestMovieRemoteDataSource: QuickSpec {
    override func spec() {
        
        let apiDataSource = MovieApiDataSourceMock()
        var remoteDataSource: MovieRemoteDataSource?
        
        beforeEach {
            MovieRemoteDataSourceImpl.destroyInstance()
            remoteDataSource = MovieRemoteDataSourceImpl.getInstance(apiDataSource: apiDataSource)
        }
        
        describe("#allReleasesBy") {
            let page     = 1
            let action   = "allReleasesBy"
            let expected = [page.description]
            
            context("When call allReleasesBy") {
                
                beforeEach {
                    remoteDataSource?
                        .allReleasesBy(page: page) { _ in }
                }
                
                it("Should call allReleasesBy on api data source") {
                    expect(apiDataSource.parameters(forAction: action)).to(equal(expected))
                }
            }
        }        
    }
}

