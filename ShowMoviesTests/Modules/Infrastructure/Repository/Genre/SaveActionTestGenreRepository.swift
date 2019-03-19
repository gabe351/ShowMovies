//
//  SaveActionTestGenreRepository.swift
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
class SaveActionTestGenreRepository: QuickSpec {
    override func spec() {
        
        let remoteDataSource = GenreRemoteDataSourceMock()
        let localDataSource  = GenreLocalDataSourceMock()
        var repository: GenreRepository?
        
        beforeEach {
            GenreRepositoryImpl.destroyInstance()
            repository = GenreRepositoryImpl.getInstance(remoteDataSource: remoteDataSource,
                                                         localDataSource: localDataSource)
        }
        
        describe("#save") {
            let genre    = Genre(id: 132131, name: "my test genre")
            let action   = "save"
            let expected = [genre.id.description, genre.name]
            
            context("When call save") {
                beforeEach {
                    repository?.save(genre: genre)
                }
                
                it("Should call local data source") {
                    expect(localDataSource.parameters(forAction: action)).to(equal(expected))
                }
            }            
        }
    }
}
