//
//  GenreConverter.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 19/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

public func convertGenreResponseToEntity(response: GenreResponse) -> Genre {
    return Genre(id: defaultIntIfNil(response.id),
                 name: defaultStringIfNil(response.name))
}

public func convertGenresResponsesToEntities(responses: [GenreResponse]) -> [Genre] {
    var genres = [Genre]()
    
    responses.forEach {
        let entity = convertGenreResponseToEntity(response: $0)
        genres.append(entity)
    }
    
    return genres
}
