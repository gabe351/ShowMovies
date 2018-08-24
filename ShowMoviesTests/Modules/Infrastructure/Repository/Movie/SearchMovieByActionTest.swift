//
//  SearchMovieByActionTest.swift
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
class SearchMovieByActionTest: QuickSpec {
    override func spec() {
        
        let remoteDataSource = MovieRemoteDataSourceMock()
        var repository: MovieRepository?
        
        beforeEach {
            MovieRepositoryImpl.destroyInstance()
            
            repository = MovieRepositoryImpl.getInstance(remoteDataSource: remoteDataSource)
        }
        
        describe("#searchMovie") {
            let query = "text-query"
            let page  = 1
            
            let action   = "searchMovieBy"
            let expected = [query, page.description]
            
            context("When call searchMovieBy") {
                
                beforeEach {
                    repository?
                        .searchMovieBy(query: query, page: page) { (_) in }
                }
                
                it("Should call searchMovieBy on remote data source") {
                    expect(remoteDataSource.parameters(forAction: action)).to(equal(expected))
                }
            }
        }
        
    }
}
