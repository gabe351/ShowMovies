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
                                    getMovie: provideGetMovies(),
                                    getGenre: provideGetGenres())
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        hideKeyboardWhenTappedAround()
        self.tabBarController?.tabBar.tintColor = UIColor.white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        moviesTableView.contract = self
        
        if movies.isEmpty {
            showEmptyLabelWith(text: "Type a query to search for movies")
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        
        guard let query = searchBar.text else {
            return
        }
        
        self.movies                 = [Movie]()
        moviesTableView.currentPage = 1
        self.query                  = query
        presenter.findMovie(page: 1, query: query)
    }
}

extension SearchMovieViewController: SearchMovieViewContract {
    func show(baseMovie: BaseMovie) {
        let allMovies               = movies + baseMovie.movies
        self.movies                 = allMovies
        currentPage                 = baseMovie.page
        lastPage                    = baseMovie.totalPages
        moviesTableView.currentPage = currentPage
        moviesTableView.lastPage    = lastPage
        emptyLabel.alpha            = 0
        moviesTableView.setupWith(movies: allMovies)
    }
    
    func emptyList() {
        moviesTableView.setupWith(movies: [])
        var message = "Sorry, we do not found any movie for your search: \(query)"
        
        if query.isEmpty {
            message = "Type some text to search for movies"
        }
        
        showEmptyLabelWith(text: message)
    }
    
    func onError() {
        showEmptyLabelWith(text: "Sorry, we have some errors to find movies")
    }
    
    func showLoader() {
        add(loader)
        emptyLabel.alpha = 0
    }
    
    func hideLoader() {
        loader.remove()
    }
    
    private func showEmptyLabelWith(text: String) {
        emptyLabel.text  = text
        emptyLabel.alpha = 1
    }
}

extension SearchMovieViewController: MoviesTableViewContract {
    
    func request(nextPage: Int) {
        presenter.findMovie(page: nextPage, query: query)
    }
    
    func goToDetail(id: Int) {
        let movieDetail: MovieDetailViewController = loadNibNamed(MovieDetailViewController.NIB_NAME, owner: self)!
        movieDetail.movieId = id
        self.navigationController?.pushViewController(movieDetail, animated: true)
    }
    
    func getGenreTitlesBy(ids: [Int]) -> String {
        return presenter.getGenreTitlesBy(ids: ids)
    }
}
