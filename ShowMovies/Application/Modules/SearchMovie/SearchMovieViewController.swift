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
    
    let loader: LoadingViewController = LoadingViewController()
    
    lazy var presenter: SearchMoviePresenterContract = {
        return SearchMoviePresenter(view: self,
                                    getMovie: provideGetMovies())
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()                        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        moviesTableView.contract = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else {
            return
        }
        
        presenter.findMovie(page: 1, query: query)
    }
}

extension SearchMovieViewController: SearchMovieViewContract {
    func show(movies: [Movie]) {
        moviesTableView.setupWith(movies: movies)
    }
    
    func emptyList() {
        
    }
    
    func onError() {
        
    }
    
    func showLoader() {
        add(loader)
    }
    
    func hideLoader() {
        loader.remove()
    }
}

extension SearchMovieViewController: MoviesTableViewContract {
    
    func request(nextPage: Int) {
        
    }
    
    func goToDetail(id: Int) {
        let movieDetail: MovieDetailViewController = loadNibNamed(MovieDetailViewController.NIB_NAME, owner: self)!
        movieDetail.movieId = id
        self.navigationController?.pushViewController(movieDetail, animated: true)
    }
}
