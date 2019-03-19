//
//  DefaultDateIfNilActionTest.swift
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
class DefaultDateIfNilActionTest: QuickSpec {
    
    override func spec() {
        
        describe("default Date if nil action") {
            
            var result = Date()
            
            context("When pass a default value in method") {
                
                var defaultValue = Date()
                
                context("when value passed is nil") {
                    
                    beforeEach {
                        defaultValue = Date().addingTimeInterval(15000)
                        result = defaultDateIfNil(nil, defaultValue: defaultValue)
                    }
                    
                    it("Should return default value") {
                        expect(result).to(equal(defaultValue))
                    }
                }
                
                context("When value passed is not nil") {
                    
                    var value = Date()
                    
                    beforeEach {
                        value = Date().addingTimeInterval(12000)
                        result = defaultDateIfNil(value, defaultValue: defaultValue)
                    }
                    
                    it("Should return value passed value") {
                        expect(result).to(equal(value))
                    }
                }
            }
            
            context("When do not pass default value in method") {
                
                context("When value passed is not nil") {
                    
                    var value = Date()
                    
                    beforeEach {
                        value = Date().addingTimeInterval(100000)
                        result = defaultDateIfNil(value)
                    }
                    
                    it("Should return value passed value") {
                        expect(result).to(equal(value))
                    }
                }
            }
        }
    }
}




