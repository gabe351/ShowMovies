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
    var movies = [Movie]()
    
    lazy var presenter: ReleasesPresenterContract = {
        return ReleasesPresenter(view: self,
                                 getMovie: provideGetMovies())
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviesTableView.contract = self
        
        presenter.loadReleases(page: 1)
    }        
}

extension ReleasesViewController: ReleasesViewContract {
    
    func show(baseMovie: BaseMovie) {
        moviesTableView.setupWith(movies: baseMovie.movies)
        self.movies = baseMovie.movies
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
        
    }
    
    func goToDetail(id: Int) {
        let movieDetail: MovieDetailViewController = loadNibNamed(MovieDetailViewController.NIB_NAME, owner: self)!
        movieDetail.movieId = id
        self.navigationController?.pushViewController(movieDetail, animated: true)
    }
}
