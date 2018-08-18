//
//  MovieDetailViewController.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 18/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController, MovieDetailViewContract {
    
    static let NIB_NAME = "MovieDetailViewController"
    
    var movieId: Int = 0
    let loader = LoadingViewController()
    var movieDetail: MovieDetail?
    
//    lazy var presenter: MovieDetailPresenterContract = {
//        return MovieDetailPresenter(view: self,
//                                    getMovie: InjectionUseCase.provideGetMovies())
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureView()
//        presenter.loadMovieDetail(id: movieId)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    func show(detail: MovieDetail) {
//        movieImageView.setImageFrom(url: RemoteUtils.buildImageUrl(path: detail.posterPath), placeholder: #imageLiteral(resourceName: "moviePlaceholder"))
//        movieTitle.text               = detail.title
//        releaseDateLabel.text         = "Release: \(detail.releaseDate)"
//        movieDescriptionTextView.text = detail.overview
//        genreLabel.text               = "Genre: \(detail.genres.first?.name ?? " ")"
//        movieDetail                   = detail
    }
    
    func onError() {
//        ToastBuilder(message: "Error on request, check internet", view: self.view)
//            .with(position: .center)
//            .show()
    }
    
    func showLoader() {
        add(loader)
    }
    
    func hideLoader() {
        loader.remove()
    }
    
    private func configureView() {
        guard let navigationController = self.navigationController else {
            return
        }
        
        navigationController.isNavigationBarHidden    = false
        navigationController.topViewController?.title = "Movie detail"
    }
}

