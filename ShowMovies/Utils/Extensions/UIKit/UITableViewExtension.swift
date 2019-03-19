//
//  UITableViewExtension.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 26/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

extension UITableView {
    func reloadDataSmoothly() {
        UIView.setAnimationsEnabled(false)
        CATransaction.begin()
        
        CATransaction.setCompletionBlock { () -> Void in
            UIView.setAnimationsEnabled(true)
        }
        
        reloadData()
        beginUpdates()
        endUpdates()
        
        CATransaction.commit()
    }
}
