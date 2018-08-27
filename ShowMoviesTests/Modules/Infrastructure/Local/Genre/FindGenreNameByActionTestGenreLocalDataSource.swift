//
//  FindGenreNameByActionTestGenreLocalDataSource.swift
//  ShowMoviesTests
//
//  Created by Gabriel Rosa on 27/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Quick
import Nimble
@testable import ShowMovies

class FindGenreNameByActionTestGenreLocalDataSource: QuickSpec {
    override func spec() {
        
        var localDataSource: GenreLocalDataSource?
        var result: String?
        var expected = ""
        var id       = 0
        
        let findAction: Action = Action() {
            result = localDataSource?.findGenreNameBy(id: id)
        }
        
        beforeEach {
            GenreLocalDataSourceImpl.destroyInstance()
            localDataSource = GenreLocalDataSourceImpl.getInstance()
        }
        
        
        describe("findGenreNameBy") {
            
            context("When find a saved genre") {
                
                beforeEach {
                    execute(action: findAction) {
                        expected = "My genre"
                        id       = 1231241241
                        let genre = Genre(id: id, name: expected)
                        UserDefaults
                            .standard
                            .setValue(genre.name,
                                      forKey: genre.id.description)
                    }
                }
             
                it("Should have same title")  {
                    expect(result).to(equal(expected))
                }
            }
            
            context("When do not have any saved genre") {
                
                beforeEach {
                    id = 0
                    execute(action: findAction) { }
                }
                
                it("should find a empty title") {
                    expect(result).to(beEmpty())
                }
            }
        }
    }
}
