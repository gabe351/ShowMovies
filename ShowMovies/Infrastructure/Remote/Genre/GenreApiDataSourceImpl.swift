//
//  GenreApiDataSourceImpl.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 26/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

public class GenreApiDataSourceImpl: GenreApiDataSource {
    
    private static var INSTANCE: GenreApiDataSourceImpl?
    
    public static func getInstance() -> GenreApiDataSourceImpl {
        if (INSTANCE == nil) {
            INSTANCE = GenreApiDataSourceImpl()
        }
        
        return INSTANCE!
    }
    
    public static func destroyInstance() {
        INSTANCE = nil
    }
    
    public func allGenres(_ loadCallback: @escaping (BaseCallback<[Genre]>) -> Void) {
        let parameters = buildGenreParams()
        let path       = "genre/movie/list"
        
        Alamofire.request(RemoteUtils.buildUrl(path: path), method: .get, parameters: parameters).responseObject { (response: DataResponse<BaseGenresResponse>) in
            switch(response.result) {
            case .success(let response):
                
                guard let genres = response.genres else {
                    loadCallback(BaseCallback.emptyData())
                    return
                }
                
                if genres.isEmpty {
                    loadCallback(BaseCallback.emptyData())
                    return
                }
                
                loadCallback(BaseCallback.success(convertGenresResponsesToEntities(responses: genres)))
                
                break
                
            case .failure(let error):
                loadCallback(BaseCallback.failed(error: error))
                break
            }
        }
        
    }
    
    private func buildGenreParams(apiKey: String = "1f54bd990f1cdfb230adb312546d765d",
                                  language: String = "en-US") -> [String:Any] {
        let parameters: [String: Any] = [
            "api_key"  : apiKey,
            "language" : language
        ]
        
        return parameters
    }
}
