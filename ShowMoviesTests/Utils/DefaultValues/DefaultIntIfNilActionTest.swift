//
//  DefaultIntIfNilActionTest.swift
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
class DefaultIntIfNilActionTest: QuickSpec {
    
    override func spec() {
        
        describe("default Int if nil action") {
            
            var result = Int()
            
            context("When pass a default value in method") {
                
                var defaultValue = Int()
                
                context("when value passed is nil") {
                    
                    beforeEach {
                        defaultValue = 5
                        result = defaultIntIfNil(nil, defaultValue: defaultValue)
                    }
                    
                    it("Should return default value") {
                        expect(result).to(equal(defaultValue))
                    }
                }
                
                context("When value passed is not nil") {
                    
                    var value = Int()
                    
                    beforeEach {
                        value = 124
                        result = defaultIntIfNil(value, defaultValue: defaultValue)
                    }
                    
                    it("Should return value passed value") {
                        expect(result).to(equal(value))
                    }
                }
            }
            
            context("When do not pass default value in method") {
                
                context("when value passed is nil") {
                    
                    beforeEach {
                        result = defaultIntIfNil(nil)
                    }
                    
                    it("Should return default value") {
                        expect(result).to(equal(0))
                    }
                }
                
                context("When value passed is not nil") {
                    
                    var value = Int()
                    
                    beforeEach {
                        value = 423
                        result = defaultIntIfNil(value)
                    }
                    
                    it("Should return value passed value") {
                        expect(result).to(equal(value))
                    }
                }
            }
        }
    }
}


