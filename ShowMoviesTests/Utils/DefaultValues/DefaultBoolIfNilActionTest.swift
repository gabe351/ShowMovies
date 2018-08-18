//
//  DefaultBoolIfNilActionTest.swift
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
class DefaultBoolIfNilActionTest: QuickSpec {
    
    override func spec() {
        
        describe("default bool if nil action") {
            
            var result = Bool()
            
            context("When pass a default value in method") {
                
                var defaultValue = Bool()
                
                context("when value passed is nil") {
                    
                    beforeEach {
                        defaultValue = true
                        result = defaultBoolIfNil(nil, defaultValue: defaultValue)
                    }
                    
                    it("Should be true") {
                        expect(result).to(beTrue())
                    }
                }
                
                context("When value passed is not nil") {
                    
                    var value = Bool()
                    
                    beforeEach {
                        value = true
                        result = defaultBoolIfNil(value, defaultValue: defaultValue)
                    }
                    
                    it("Should be true") {
                        expect(result).to(beTrue())
                    }
                }
            }
            
            context("When do not pass default value in method") {
                
                context("when value passed is nil") {
                    
                    beforeEach {
                        result = defaultBoolIfNil(nil)
                    }
                    
                    it("Should be false") {
                        expect(result).to(beFalse())
                    }
                }
                
                context("When value passed is not nil") {
                    
                    var value = Bool()
                    
                    beforeEach {
                        value = true
                        result = defaultBoolIfNil(value)
                    }
                    
                    it("Should be true") {
                        expect(result).to(beTrue())
                    }
                }
            }
        }
    }
}


