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
    @IBOutlet weak var moviesTableView: MoviesTableView!
    @IBOutlet weak var emptyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()                        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        moviesTableView.contract = self
        moviesTableView.setupWith(movies: [mockMovie(), mockMovie(), mockMovie(), mockMovie(), mockMovie(), mockMovie(), mockMovie(), mockMovie(), mockMovie(), mockMovie(), mockMovie() , mockMovie()])
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else {
            return
        }
        
//        presenter.findMovie(page: 1, query: query)
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

extension SearchMovieViewController: MoviesTableViewContract {
    
    func request(nextPage: Int) {
        
    }
    
    func goToDetail(id: Int) {
        let movieDetail: MovieDetailViewController = loadNibNamed(MovieDetailViewController.NIB_NAME, owner: self)!
        movieDetail.movieId = 1
        self.navigationController?.pushViewController(movieDetail, animated: true)
    }
}
