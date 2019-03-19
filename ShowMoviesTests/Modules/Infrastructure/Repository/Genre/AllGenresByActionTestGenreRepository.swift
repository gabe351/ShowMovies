//
//  AllGenresByActionTest.swift
//  ShowMoviesTests
//
//  Created by Gabriel Rosa on 27/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Quick
import Nimble
@testable import ShowMovies
/**
 Unit tests for the implementation of {@link GenreRepositoryImpl}
 */
class AllGenresByActionTestGenreRepository: QuickSpec {
    override func spec() {
        
        let remoteDataSource = GenreRemoteDataSourceMock()
        let localDataSource  = GenreLocalDataSourceMock()
        var repository: GenreRepository?
        
        beforeEach {
            GenreRepositoryImpl.destroyInstance()
            repository = GenreRepositoryImpl.getInstance(remoteDataSource: remoteDataSource,
                                                         localDataSource: localDataSource)
        }
        
        describe("#allGenres") {
            
            let action   = "allGenres"
            let expected = ["Called success"]
            
            context("When call all genres") {
                
                beforeEach {
                    repository?.allGenres() { (_) in }
                }
                
                it("Should call remote data source") {
                    expect(remoteDataSource.parameters(forAction: action)).to(equal(expected))
                }
            }
        }
    }
}
