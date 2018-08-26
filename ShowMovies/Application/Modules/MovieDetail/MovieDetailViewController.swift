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
        let imageUrl     = RemoteUtils.buildImageUrl(path: detail.posterPath)
        let genresTitle  = detail.genres.map { genre -> String in genre.name }        
        animateViews { [unowned self] in
            self.movieImageView.setImageFrom(url: imageUrl, placeholder: #imageLiteral(resourceName: "moviePlaceholder"))
            self.movieBgImageView.setImageFrom(url: imageUrl, placeholder: #imageLiteral(resourceName: "moviePlaceholder"))
            self.movieTitleLabel.text      = detail.title
            self.releaseDateLabel.text     = "Release: " + detail.releaseDate
            self.genreLabel.text           = "Genre: " + genresTitle.joined(separator: ", ")
            self.overViewLabel.text        = "OverView"
            self.overViewContentLabel.text = detail.overview
        }
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
    
    private func animateViews(_ actionBlock: @escaping () -> ()) {
        UIView.animate(withDuration: 0.5) { [unowned self] in
            self.showViews()
            actionBlock()
        }
    }
    
    private func showViews() {
        self.movieImageView.alpha       = 1
        self.movieBgImageView.alpha     = 1
        self.movieTitleLabel.alpha      = 1
        self.releaseDateLabel.alpha     = 1
        self.genreLabel.alpha           = 1
        self.overViewLabel.alpha        = 1
        self.overViewContentLabel.alpha = 1
    }
}

