//
//  GenreApiDataSource.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 26/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

public protocol GenreApiDataSource: class {
    func allGenres(_ loadCallback: @escaping (BaseCallback<[Genre]>) -> Void)
}
