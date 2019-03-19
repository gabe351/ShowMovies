//
//  GenreApiDataSourceMock\.swift
//  ShowMoviesTests
//
//  Created by Gabriel Rosa on 27/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation
@testable import ShowMovies

class GenreApiDataSourceMock: GenreApiDataSource, DoubleBlockWithNoReturnProtocol, DoubleParametersProtocol {
    
    var doubleParameters: DoubleParameters?
    var doubleBlockWithNoReturn: DoubleBlockWithNoReturn?
    
    func allGenres(_ loadCallback: @escaping (BaseCallback<[Genre]>) -> Void) {
        let action     = "allGenres"
        let parameters = ["Called success"]
        
        doubleBlockWithNoReturn?.runBlockWithNoReturn(forAction: action)
        doubleParameters = buildDoubleParameters(forAction: action, parameters: parameters)
    }
}
