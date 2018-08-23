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
    var query       = ""
    var movies      = [Movie]()
    var currentPage = 1
    var lastPage    = 1
    
    lazy var presenter: SearchMoviePresenterContract = {
        return SearchMoviePresenter(view: self,
                                    getMovie: provideGetMovies())
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        moviesTableView.contract = self
        
        if movies.isEmpty {
            configureEmptyLabelWith(text: "Type a query to search for movies")
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        
        guard let query = searchBar.text else {
            return
        }
        
        if query.isEmpty {
            configureEmptyLabelWith(text: "Type some text to search for movies")
            return
        }
        
        self.movies                 = [Movie]()
        moviesTableView.currentPage = 1
        self.query                  = query
        presenter.findMovie(page: 1, query: query)
    }
}

extension SearchMovieViewController: SearchMovieViewContract {
    func show(movies: [Movie]) {
        configure(emptyLabelAlpha: 0,
                  moviesTableViewAlpha: 1)
        moviesTableView.setupWith(movies: movies)
        
        self.movies = movies
    }
    
    func emptyList() {
        configureEmptyLabelWith(text: "Sorry, we do not found any movie for your search: \(query)")
        moviesTableView.setupWith(movies: [])
    }
    
    func onError() {
        configureEmptyLabelWith(text: "Sorry, we have some errors to find movies")
    }
    
    func showLoader() {
        add(loader)
        configure(emptyLabelAlpha: 0,
                  moviesTableViewAlpha: 0)
    }
    
    func hideLoader() {
        loader.remove()
    }
    
    private func configureEmptyLabelWith(text: String) {
        emptyLabel.text = text
        configure(emptyLabelAlpha: 1, moviesTableViewAlpha: 0)
    }
    
    private func configure(emptyLabelAlpha: CGFloat,
                           moviesTableViewAlpha: CGFloat) {
        self.moviesTableView.alpha = moviesTableViewAlpha
        self.emptyLabel.alpha      = emptyLabelAlpha
    }
}

extension SearchMovieViewController: MoviesTableViewContract {
    
    func request(nextPage: Int) {
//        presenter.findMovie(page: nextPage, query: query)
    }
    
    func goToDetail(id: Int) {
        let movieDetail: MovieDetailViewController = loadNibNamed(MovieDetailViewController.NIB_NAME, owner: self)!
        movieDetail.movieId = id
        self.navigationController?.pushViewController(movieDetail, animated: true)
    }
}
