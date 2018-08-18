//
//  DefaultStringIfNilActionTest.swift
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
 Unit tests for the implementation of {@link DefaultValues}
 */
class DefaultStringIfNilActionTest: QuickSpec {
    
    override func spec() {
        
        describe("default string if nil action") {
            
            var result = "initial-value"
            
            context("When pass a default value in method") {
                
                var defaultValue = ""
                
                context("when value passed is nil") {
                    
                    beforeEach {
                        defaultValue = "my-default"
                        result = defaultStringIfNil(nil, defaultValue: defaultValue)
                    }
                    
                    it("Should return default value") {
                        expect(result).to(equal(defaultValue))
                    }
                }
                
                context("When value passed is not nil") {
                    
                    var value = ""
                    
                    beforeEach {
                        value = "my-value"
                        result = defaultStringIfNil(value, defaultValue: defaultValue)
                    }
                    
                    it("Should return value passed value") {
                        expect(result).to(equal(value))
                    }
                }
            }
            
            context("When do not pass default value in method") {
                
                context("when value passed is nil") {
                    
                    beforeEach {
                        result = defaultStringIfNil(nil)
                    }
                    
                    it("Should return default value") {
                        expect(result).to(beEmpty())
                    }
                }
                
                context("When value passed is not nil") {
                    
                    var value = ""
                    
                    beforeEach {
                        value = "my-value"
                        result = defaultStringIfNil(value)
                    }
                    
                    it("Should return same parameter value") {
                        expect(result).to(equal(value))
                    }
                }
            }
        }
    }
}

