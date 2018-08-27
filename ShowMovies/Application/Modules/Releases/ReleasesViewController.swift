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
        
        hideKeyboardWhenTappedAround()
        presenter.loadReleases(page: currentPage)
        self.tabBarController?.tabBar.tintColor = UIColor.white        
    }
    
    private func buildAlertWith(title: String, message: String, actionTitle: String, _ actionClosure: @escaping () -> ()) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: { (action) in
            actionClosure()
        }))
        
        return alert
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
        let alert = buildAlertWith(title: "Empty List", message: "We got a empty list.", actionTitle: "ok") { [unowned self] in
            self.dismiss(animated: true, completion: nil)
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    func onError(error: Any) {
        let title   = "Failed :("
        let message = "Sorry, we had some error to load movies click 'Reload' to try again"
        let actionTitle = "Reload"
        let alert = buildAlertWith(title: title, message: message, actionTitle: actionTitle) { [unowned self] in
            self.presenter.loadReleases(page: self.currentPage)
        }
        
        self.present(alert, animated: true, completion: nil)
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
