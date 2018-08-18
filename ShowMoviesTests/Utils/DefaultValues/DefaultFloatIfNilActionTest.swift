//
//  DefaultFloatIfNilActionTest.swift
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
class DefaultFloatIfNilActionTest: QuickSpec {
    
    override func spec() {
        
        describe("default Float if nil action") {
            
            var result = Float()
            
            context("When pass a default value in method") {
                
                var defaultValue = Float()
                
                context("when value passed is nil") {
                    
                    beforeEach {
                        defaultValue = 15.0
                        result = defaultFloatIfNil(nil, defaultValue: defaultValue)
                    }
                    
                    it("Should return default value") {
                        expect(result).to(equal(defaultValue))
                    }
                }
                
                context("When value passed is not nil") {
                    
                    var value = Float()
                    
                    beforeEach {
                        value = 10.0
                        result = defaultFloatIfNil(value, defaultValue: defaultValue)
                    }
                    
                    it("Should return value passed value") {
                        expect(result).to(equal(value))
                    }
                }
            }
            
            context("When do not pass default value in method") {
                
                context("when value passed is nil") {
                    
                    beforeEach {
                        result = defaultFloatIfNil(nil)
                    }
                    
                    it("Should return default value") {
                        expect(result).to(equal(Float()))
                    }
                }
                
                context("When value passed is not nil") {
                    
                    var value = Float()
                    
                    beforeEach {
                        value = 8.0
                        result = defaultFloatIfNil(value)
                    }
                    
                    it("Should return value passed value") {
                        expect(result).to(equal(value))
                    }
                }
            }
        }
    }
}


