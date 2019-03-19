//
//  BaseCallback.swift
//  ShowMovies
//
//  Created by Gabriel Rosa on 18/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

public class BaseCallback<T> {
    private let status: String
    private var responseSuccess: T?
    private var error: Any?
    
    public class func success(_ response: T) -> BaseCallback {
        return BaseCallback(status: CallbackEnum.success.rawValue, responseSuccess: response)
    }
    
    public class func failed(error: Any? = nil) -> BaseCallback {
        return BaseCallback(status: CallbackEnum.failed.rawValue, error: error)
    }
    
    public class func emptyData() -> BaseCallback {
        return BaseCallback(status: CallbackEnum.onEmptyData.rawValue)
    }
    
    private init(status: String, error: Any? = nil) {
        self.status = status
        self.error  = error
    }
    
    private init(status: String, responseSuccess: T) {
        self.status          = status
        self.responseSuccess = responseSuccess
    }
    
    public func onSuccess(_ response: (T) -> Void) {
        if status == CallbackEnum.success.rawValue {
            response(responseSuccess!)
        }
    }
    
    public func onFailed(_ response: (Any?) -> Void) {
        if status == CallbackEnum.failed.rawValue {
            response(error)
        }
    }
    
    public func onEmptyData(_ response: () -> Void){
        if status == CallbackEnum.onEmptyData.rawValue {
            response()
        }
    }
    
}

