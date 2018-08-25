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
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieBgImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
    @IBOutlet weak var overViewContentLabel: UILabel!
    
    var movieId = 0
    let loader  = LoadingViewController()
    var movieDetail: MovieDetail?
    
    lazy var presenter: MovieDetailPresenterContract = {
        return MovieDetailPresenter(view: self,
                                    getMovie: provideGetMovies())
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureView()
        
        presenter.loadMovieDetail(id: movieId)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    func show(detail: MovieDetail) {
        let imageUrl         = RemoteUtils.buildImageUrl(path: detail.posterPath)
        let genresTitle = detail.genres.map { genre -> String in genre.name }
        movieImageView.setImageFrom(url: imageUrl, placeholder: #imageLiteral(resourceName: "moviePlaceholder"))
        movieBgImageView.setImageFrom(url: imageUrl, placeholder: #imageLiteral(resourceName: "moviePlaceholder"))
        movieTitleLabel.text      = detail.title
        releaseDateLabel.text     = "Release: " + detail.releaseDate
        genreLabel.text           = "Genre: " + genresTitle.joined(separator: ", ")
        overViewContentLabel.text = detail.overview
    }
    
    func onError() {
        
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
        navigationController.topViewController?.title = "Movie Detail"
    }
}

