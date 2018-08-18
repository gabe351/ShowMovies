//
//  MoviesCollectionView.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 18/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class MoviesCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var movies = [Movie]()
    weak var contract: MoviesCollectionViewContract?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let movieCell = UINib(nibName: MovieCell.NIB_NAME, bundle: nil)
        self.register(movieCell, forCellWithReuseIdentifier: MovieCell.IDENTIFIER)
        
        self.delegate   = self
        self.dataSource = self
    }
    
    func setupWith(movies: [Movie]) {
        self.movies               = movies
        self.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.dequeueReusableCell(withReuseIdentifier: MovieCell.IDENTIFIER, for: indexPath as IndexPath) as! MovieCell
        
        let movie = movies[indexPath.row]
        
        cell.configureView(movie: movie)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        contract?.goToDetail(id: movies[indexPath.row].id)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        contract?.request(nextPage: 1)
    }
}


