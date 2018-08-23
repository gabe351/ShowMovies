//
//  GetMovies.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 18/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

public class GetMovies {
    
    private weak var repository: MovieRepository?

    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    public func allReleasesBy(page: Int, _ loadCallback: @escaping (BaseCallback<BaseMovie>) -> Void) {
        repository?.allReleasesBy(page: page, loadCallback)
    }

    public func searchMovieBy(query: String, page: Int, _ loadCallback: @escaping (BaseCallback<BaseMovie>) -> Void) {
        repository?.searchMovieBy(query: query, page: page, loadCallback)
    }

    public func movieDetail(id: Int, _ loadCallback: @escaping (BaseCallback<MovieDetail>) -> Void) {
        repository?.movieDetail(id: id, loadCallback)
    }
}

