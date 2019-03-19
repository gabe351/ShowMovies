//
//  FindGenreNameByActionTestGenreRepository.swift
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
class FindGenreNameByActionTestGenreRepository: QuickSpec {
    override func spec() {
        
        let remoteDataSource = GenreRemoteDataSourceMock()
        let localDataSource  = GenreLocalDataSourceMock()
        var repository: GenreRepository?
        
        beforeEach {
            GenreRepositoryImpl.destroyInstance()
            repository = GenreRepositoryImpl.getInstance(remoteDataSource: remoteDataSource,
                                                         localDataSource: localDataSource)
        }
        
        describe("#findGenreNameBy") {
            
            let action   = "findGenreNameBy"
            let id       = 123456
            let expected = [id.description]
            
            context("When call find genre name by") {
                beforeEach {
                    let _ = repository?.findGenreNameBy(id: id)
                }
                
                it("Should call local data source") {
                    expect(localDataSource.parameters(forAction: action)).to(equal(expected))
                }
            }
        }
    }
}
