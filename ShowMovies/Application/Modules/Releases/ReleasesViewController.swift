//
//  ReleasesViewController.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 18/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class ReleasesViewController: UIViewController {
    
    @IBOutlet weak var moviesTableView: MoviesTableView!
    
    let loader: LoadingViewController = LoadingViewController()
    var movies      = [Movie]()
    var currentPage = 1
    var lastPage    = 1
    
    lazy var presenter: ReleasesPresenterContract = {
        return ReleasesPresenter(view: self,
                                 getMovie: provideGetMovies())
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviesTableView.contract    = self
        moviesTableView.currentPage = currentPage
        moviesTableView.lastPage    = lastPage
        
        presenter.loadReleases(page: currentPage)
        hideKeyboardWhenTappedAround()
    }
    
}

extension ReleasesViewController: ReleasesViewContract {
    
    func show(baseMovie: BaseMovie) {
        let allMovies               = movies + baseMovie.movies
        self.movies                 = allMovies
        currentPage                 = baseMovie.page
        lastPage                    = baseMovie.totalPages
        moviesTableView.currentPage = currentPage
        moviesTableView.lastPage    = lastPage
        moviesTableView.setupWith(movies: allMovies)
    }
    
    func emptyList() {
        
    }
    
    func onError(error: Any) {
        
    }
    
    func showLoader() {
        add(loader)
    }
    
    func hideLoader() {
        loader.remove()
    }
}

extension ReleasesViewController: MoviesTableViewContract {
    
    func request(nextPage: Int) {
        presenter.loadReleases(page: nextPage)
    }
    
    func goToDetail(id: Int) {
        let movieDetail: MovieDetailViewController = loadNibNamed(MovieDetailViewController.NIB_NAME, owner: self)!
        movieDetail.movieId = id
        self.navigationController?.pushViewController(movieDetail, animated: true)
    }
}
