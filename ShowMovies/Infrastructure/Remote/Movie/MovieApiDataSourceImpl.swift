//
//  MovieApiDataSourceImpl.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 19/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

public class MovieApiDataSourceImpl: MovieApiDataSource {
    
    private static var INSTANCE: MovieApiDataSourceImpl?
    
    public static func getInstance() -> MovieApiDataSourceImpl {
        if (INSTANCE == nil) {
            INSTANCE = MovieApiDataSourceImpl()
        }
        
        return INSTANCE!
    }
    
    public static func destroyInstance() {
        INSTANCE = nil
    }
    
    public func searchMovieBy(query: String, page: Int, _ loadCallback: @escaping (BaseCallback<[Movie]>) -> Void) {
        let parameters = buildSearchParams(page: page, query: query)
        let path       = "search/movie"
        
        Alamofire.request(RemoteUtils.buildUrl(path: path), method: .get, parameters: parameters).responseObject { (response: DataResponse<BaseMoviesResponse>) in
            switch(response.result) {
            case .success(let response):
                guard let moviesResponse = response.results else {
                    loadCallback(BaseCallback.emptyData())
                    return
                }
                
                if moviesResponse.isEmpty {
                    loadCallback(BaseCallback.emptyData())
                    return
                }
                
                let movies = convertMoviesResponsesToEntities(responses: moviesResponse)
                
                loadCallback(BaseCallback.success(movies))
                
                break
                
            case .failure(let error):
                loadCallback(BaseCallback.failed(error: error))
                break
            }
        }
    }
    
    public func allReleasesBy(page: Int, _ loadCallback: @escaping (BaseCallback<BaseMovie>) -> Void) {
        let parameters = buildReleasesParams(page: page)
        let path       = "discover/movie"
        
        Alamofire.request(RemoteUtils.buildUrl(path: path), method: .get, parameters: parameters).responseObject { (response: DataResponse<BaseMoviesResponse>) in
            
            switch(response.result) {
            case .success(let response):
                guard let moviesResponse = response.results else {
                    loadCallback(BaseCallback.emptyData())
                    return
                }
                
                if moviesResponse.isEmpty {
                    loadCallback(BaseCallback.emptyData())
                    return
                }
                
//                let movies = convertMoviesResponsesToEntities(responses: moviesResponse)
                let baseMovie = convertBaseMovieResponseToEntity(response: response)
                
                loadCallback(BaseCallback.success(baseMovie))
                break
                
            case .failure(let error):
                loadCallback(BaseCallback.failed(error: error))
                break
            }
        }
    }
    
    public func movieDetail(id: Int, _ loadCallback: @escaping (BaseCallback<MovieDetail>) -> Void) {
        let parameters = buildDetailParams()
        let path       = "movie/\(id)"
        
        Alamofire.request(RemoteUtils.buildUrl(path: path), method: .get, parameters: parameters).responseObject { (response: DataResponse<MovieDetailResponse>) in
            switch(response.result) {
            case .success(let response):
                let movieResponse = convertMovieDetailResponseToEntity(response: response)
                
                loadCallback(BaseCallback.success(movieResponse))
                break
                
            case .failure(let error):
                loadCallback(BaseCallback.failed(error: error))
                break
            }
        }
    }
    
    private func buildDetailParams() -> [String:Any] {
        
        let apiKey = "1f54bd990f1cdfb230adb312546d765d"
        
        let parameters: [String: Any] = [
            "api_key" : apiKey,
            ]
        
        return parameters
    }
    
    private func buildSearchParams(apiKey: String = "1f54bd990f1cdfb230adb312546d765d",
                                   page: Int,
                                   query: String) -> [String:Any] {
        let parameters: [String: Any] = [
            "api_key" : apiKey,
            "page"    : page,
            "query"   : query
        ]
        
        return parameters
    }
    
    private func buildReleasesParams(apiKey: String = "1f54bd990f1cdfb230adb312546d765d",
                                     sortBy: String = "release_date.asc",
                                     page: Int) -> [String:Any] {
        var year     = 2019
        let calendar = NSCalendar.init(calendarIdentifier: NSCalendar.Identifier.gregorian)
        if let currentYear = calendar?.component(NSCalendar.Unit.year, from: Date()) {
            year = currentYear
        }
        
        let parameters: [String: Any] = [
            "api_key" : apiKey,
            "sort_by" : sortBy,
            "page"    : page,
            "primary_release_year" : year
        ]
        
        return parameters
    }
}


