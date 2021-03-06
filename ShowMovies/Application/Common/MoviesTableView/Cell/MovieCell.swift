//
//  MovieCell.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 18/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    public static let NIB_NAME   = "MovieCell"
    public static let IDENTIFIER = "movieCellIdentifier"
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieDateLabel: UILabel!
    @IBOutlet weak var movieGenresLabel: UILabel!
    
    public weak var delegate: MovieCellDelegate?
    
    func configureView(movie: Movie, genreTitle: String) {
        let imageUrl          = RemoteUtils.buildImageUrl(path: movie.posterPath)
        movieTitleLabel.text  = movie.title
        movieDateLabel.text   = movie.releaseDate
        movieGenresLabel.text = genreTitle
        movieImageView.setImageFrom(url: imageUrl, placeholder: #imageLiteral(resourceName: "moviePlaceholder"))
    }
}

