//
//  ViewUtils.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 18/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

func loadNibNamed<T>(_ nibName: String, owner: Any?) -> T? {
    return Bundle.main.loadNibNamed(nibName, owner: owner, options: nil)?[0] as? T
}
