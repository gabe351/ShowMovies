//
//  SearchMovieByActionTest.swift
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
class SearchMovieByActionTestMovieRemoteDataSource: QuickSpec {
    override func spec() {
        
        let apiDataSource = MovieApiDataSourceMock()
        var remoteDataSource: MovieRemoteDataSource?
        
        beforeEach {
            MovieRemoteDataSourceImpl.destroyInstance()            
            remoteDataSource = MovieRemoteDataSourceImpl.getInstance(apiDataSource: apiDataSource)
        }
        
        describe("#searchMovie") {
            let query = "text-query"
            let page  = 1
            
            let action   = "searchMovieBy"
            let expected = [query, page.description]
            
            context("When call searchMovieBy") {
                
                beforeEach {
                    remoteDataSource?
                        .searchMovieBy(query: query, page: page) { (_) in }
                }
                
                it("Should call searchMovieBy on api data source") {
                    expect(apiDataSource.parameters(forAction: action)).to(equal(expected))
                }
            }
        }        
    }
}
