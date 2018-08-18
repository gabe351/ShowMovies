//
//  UIImageViewExtension.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 18/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    open func setImageFrom(url: String, placeholder: UIImage!) {
        let urlWithoutSpace = url.trim().replacingOccurrences(of: " ", with: "%20")
        self.sd_setImage(with: NSURL(string: urlWithoutSpace) as URL?, placeholderImage: placeholder)
    }
    
    open func setImageFrom(url: String, loaderStyle: UIActivityIndicatorViewStyle = .gray){
        let urlWithoutSpace = url.trim().replacingOccurrences(of: " ", with: "%20")
        self.sd_addActivityIndicator()
        self.sd_setIndicatorStyle(loaderStyle)
        self.sd_setImage(with: NSURL(string: urlWithoutSpace) as URL?)
    }
}
