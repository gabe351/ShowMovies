//
//  BuildURLWithPathActionTest.swift
//  ShowMoviesTests
//
//  Created by Gabriel Rosa on 18/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import ShowMovies
/**
 Unit tests for the implementation of {@link RemoteUtils}
 */
class BuildURLWithPathActionTest: QuickSpec {
    
    override func spec() {
        
        describe("#buildUrl") {
            
            var path   = "inital-value"
            var result = "error"
            
            context("When build url with sample path") {
                
                beforeEach {
                    path   = "sample"
                    result = RemoteUtils.buildUrl(path: path)
                }
                
                it("Should build url with sample text on it") {
                    expect(result).to(equal("https://api.themoviedb.org/3/sample"))
                }
            }
            
            context("When build url with empty path") {
                
                beforeEach {
                    path   = ""
                    result = RemoteUtils.buildUrl(path: path)
                }
                
                it("Should build a wrong url just with base") {
                    expect(result).to(equal("https://api.themoviedb.org/3/"))
                }
            }
        }
    }
}

