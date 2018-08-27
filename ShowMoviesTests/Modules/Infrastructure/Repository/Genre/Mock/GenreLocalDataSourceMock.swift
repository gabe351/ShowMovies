//
//  GenreLocalDataSourceMock.swift
//  ShowMoviesTests
//
//  Created by Gabriel Rosa on 27/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation
@testable import ShowMovies

class GenreLocalDataSourceMock: GenreLocalDataSource, DoubleBlockWithNoReturnProtocol, DoubleParametersProtocol {
    
    var doubleBlockWithNoReturn: DoubleBlockWithNoReturn?
    var doubleParameters: DoubleParameters?
    
    func save(genre: Genre) {
        let action     = "save"
        let parameters = [genre.id.description, genre.name]
        
        doubleBlockWithNoReturn?.runBlockWithNoReturn(forAction: action)
        doubleParameters = buildDoubleParameters(forAction: action, parameters: parameters)
    }
    
    func findGenreNameBy(id: Int) -> String {
        let action        = "findGenreNameBy"
        let parameters   = [id.description]
        doubleParameters = buildDoubleParameters(forAction: action, parameters: parameters)        
        return ""
    }
}
