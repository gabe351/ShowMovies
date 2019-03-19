//
//  AllGenresActionTestGenreRemoteDataSource.swift
//  ShowMoviesTests
//
//  Created by Gabriel Rosa on 27/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import ShowMovies
/**
 Unit tests for the implementation of {@link GenreRemoteDataSourceImpl}
 */
class AllGenresActionTestGenreRemoteDataSource: QuickSpec {
    override func spec() {
        
        let apiDataSource = GenreApiDataSourceMock()
        var remoteDataSource: GenreRemoteDataSource?
        
        beforeEach {
            GenreRemoteDataSourceImpl.destroyInstance()
            remoteDataSource = GenreRemoteDataSourceImpl.getInstance(apiDataSource: apiDataSource)
        }
        
        describe("#allGenres") {
            
            let action = "allGenres"
            let expected = ["Called success"]
            
            context("When call all genres") {
                
                beforeEach {
                    remoteDataSource?.allGenres() { (_) in }
                }
                
                it("Should call Api data source") {
                    expect(apiDataSource.parameters(forAction: action)).to(equal(expected))
                }
            }
        }
    }
}
