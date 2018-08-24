//
//  AllReleasesByActionTest.swift
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
class AllReleasesByActionTest: QuickSpec {
    override func spec() {
        
        let remoteDataSource = MovieRemoteDataSourceMock()
        var repository: MovieRepository?
        
        beforeEach {
            MovieRepositoryImpl.destroyInstance()
            
            repository = MovieRepositoryImpl.getInstance(remoteDataSource: remoteDataSource)
        }
        
        describe("#allReleasesBy") {
            let page     = 1            
            let action   = "allReleasesBy"
            let expected = [page.description]
            
            context("When call allReleasesBy") {
                
                beforeEach {
                    repository?.allReleasesBy(page: page) { _ in }
                }
                
                it("Should call allReleasesBy on remote data source") {
                    expect(remoteDataSource.parameters(forAction: action)).to(equal(expected))
                }
            }
        }
        
    }
}
