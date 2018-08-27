//
//  MovieCellDelegate.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 26/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol MovieCellDelegate: class {
    func requestMainGenreBy(id: Int) -> Void
}
