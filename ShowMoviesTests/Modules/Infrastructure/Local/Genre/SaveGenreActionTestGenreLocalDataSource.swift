//
//  SaveGenreActionTestGenreLocalDataSource.swift
//  ShowMoviesTests
//
//  Created by Gabriel Rosa on 27/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Quick
import Nimble
@testable import ShowMovies
/**
 Unit tests for the implementation of {@link GenreLocalDataSourceImpl}
 */
class SaveGenreActionTestGenreLocalDataSource: QuickSpec {
    override func spec() {
        
        var localDataSource: GenreLocalDataSource?
        var id       = 0
        var expected = ""
        var result: String?
        
        
        let saveAction: Action = Action() {
            result = UserDefaults.standard.string(forKey: id.description)
        }
        
        beforeEach {
            GenreLocalDataSourceImpl.destroyInstance()
            localDataSource = GenreLocalDataSourceImpl.getInstance()
        }
        
        describe("#save") {
            
            context("when try to save a genre") {
                
                beforeEach {
                    execute(action: saveAction) {
                        expected = "test-genre"
                        id       = 12345678
                        let genre = Genre(id: id, name: expected)
                        localDataSource?.save(genre: genre)
                    }
                }
                
                it("should find saved genre title") {
                    expect(result).to(equal(expected))
                }
            }
            
            context("When try to save two genres with same id") {
                
                beforeEach {
                    execute(action: saveAction) {
                        expected = "secondSaved"
                        id       = 12345678
                        let genre1 = Genre(id: id, name: "Abc")
                        let genre2 = Genre(id: id, name: expected)
                        localDataSource?.save(genre: genre1)
                        localDataSource?.save(genre: genre2)
                    }
                }

                it("Should find the last one saved genre") {
                    expect(result).to(equal(expected))
                }
            }
        }
    }
}
