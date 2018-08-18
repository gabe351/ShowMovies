//
//  SearchMovieViewController.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 18/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class SearchMovieViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var moviesCollectionView: MoviesCollectionView!
    @IBOutlet weak var emptyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()                        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        moviesCollectionView.contract = self
        moviesCollectionView.setupWith(movies: [mockMovie(), mockMovie(), mockMovie(), mockMovie(), mockMovie(), mockMovie(), mockMovie(), mockMovie(), mockMovie(), mockMovie(), mockMovie() , mockMovie()])
    }
    
    func mockMovie() -> Movie {
        
        return Movie(id: 1,
                     title: "asfasfa",
                     originalTitle: "asfasfasf",
                     voteAverage: 23,
                     posterPath: "https://img00.deviantart.net/a909/i/2006/138/3/a/protecting_the_loved_one_by_maiss_thro.jpg",
                     releaseDate: "12/10/1994")
    }
}

extension SearchMovieViewController: SearchMovieViewContract {
    func show(movies: [Movie]) {
        
    }
    
    func emptyList() {
        
    }
    
    func onError() {
        
    }
    
    func showLoader() {
        
    }
    
    func hideLoader() {
        
    }
}

extension SearchMovieViewController: MoviesCollectionViewContract {
    
    func request(nextPage: Int) {
        
    }
    
    func goToDetail(id: Int) {
        
    }
}
