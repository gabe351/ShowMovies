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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviesTableView.contract = self
        moviesTableView.setupWith(movies: [mockMovie(), mockMovie(), mockMovie(), mockMovie(), mockMovie(), mockMovie(), mockMovie(), mockMovie(), mockMovie(), mockMovie(), mockMovie() , mockMovie()])
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

extension ReleasesViewController: ReleasesViewContract {
    
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

extension ReleasesViewController: MoviesTableViewContract {
    
    func request(nextPage: Int) {
        
    }
    
    func goToDetail(id: Int) {
        let movieDetail: MovieDetailViewController = loadNibNamed(MovieDetailViewController.NIB_NAME, owner: self)!
        movieDetail.movieId = 1
        self.navigationController?.pushViewController(movieDetail, animated: true)
    }
}
