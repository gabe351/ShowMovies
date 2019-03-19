//
//  GenreRepository.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 26/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

public protocol GenreRepository: class {
    
    func allGenres(_ loadCallback: @escaping (BaseCallback<[Genre]>) -> Void)
    
    func save(genre: Genre)
    
    func findGenreNameBy(id: Int) -> String
}
