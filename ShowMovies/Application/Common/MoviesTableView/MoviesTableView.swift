//
//  MoviesTableView.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 18/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class MoviesTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var movies = [Movie]()
    weak var contract: MoviesTableViewContract?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.delegate = self
        self.dataSource = self
        
        let cell = UINib(nibName: MovieCell.NIB_NAME, bundle: nil)
        self.register(cell, forCellReuseIdentifier: MovieCell.IDENTIFIER)
        
        initialConfiguration()
    }
    
    func setupWith(movies: [Movie]) {
        self.movies               = movies
        self.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.dequeueReusableCell(withIdentifier: MovieCell.IDENTIFIER, for: indexPath as IndexPath) as! MovieCell
        
        let movie = movies[indexPath.row]
        
        cell.configureView(movie: movie)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        contract?.goToDetail(id: movies[indexPath.row].id)
    }
            
    private func initialConfiguration() {
        self.separatorStyle = .none
    }
}