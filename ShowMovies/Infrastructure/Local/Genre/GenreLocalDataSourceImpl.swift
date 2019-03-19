//
//  GenreLocalDataSourceImpl.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 26/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

public class GenreLocalDataSourceImpl: GenreLocalDataSource {
    
    private static var INSTANCE: GenreLocalDataSourceImpl?
    
    public static func getInstance() -> GenreLocalDataSourceImpl {
        if (INSTANCE == nil) {
            INSTANCE = GenreLocalDataSourceImpl()
        }
        
        return INSTANCE!
    }
    
    public static func destroyInstance() {
        INSTANCE = nil
    }
    
    public func save(genre: Genre) {
        UserDefaults.standard.setValue(genre.name, forKey: genre.id.description)
    }
    
    public func findGenreNameBy(id: Int) -> String {
        let userDefaultsData = UserDefaults.standard.string(forKey: id.description)
        guard let foundName = userDefaultsData  else {
            return ""
        }
        
        return foundName
    }
}
