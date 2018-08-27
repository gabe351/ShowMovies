//
//  InjectionLocalDataSource.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 26/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

public func provideGenreLocalDataSource() -> GenreLocalDataSource {
    return GenreLocalDataSourceImpl.getInstance()
}
