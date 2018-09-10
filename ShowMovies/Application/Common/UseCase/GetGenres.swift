//
//  GetGenres.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 26/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

public class GetGenres {
    
    private weak var repository: GenreRepository?
    
    init(repository: GenreRepository) {
        self.repository = repository
    }
    
    func allGenres(_ loadCallback: @escaping (BaseCallback<[Genre]>) -> Void) {
        repository?.allGenres(loadCallback)
    }
    
    func save(genre: Genre) {
        repository?.save(genre: genre)
    }
    
    func findGenreNameBy(id: Int) -> String {
        return defaultStringIfNil(repository?.findGenreNameBy(id: id))
    }
    
    func findGenresNameBy(ids: [Int]) -> String {
        var genreTitles = [String]()
        
        ids.forEach { (id) in
            genreTitles.append(defaultStringIfNil(repository?.findGenreNameBy(id: id)))
        }
        
        return genreTitles.joined(separator: ", ")
    }
}
