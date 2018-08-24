//
//  DoubleUtils.swift
//  ShowMoviesTests
//
//  Created by Gabriel Rosa on 23/08/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol DoubleBlockWithReturnProtocol {
    var doubleBlockWithReturn: DoubleBlockWithReturn<Any?>? { get }
}

protocol DoubleBlockWithNoReturnProtocol {
    var doubleBlockWithNoReturn: DoubleBlockWithNoReturn? { get }
}

protocol DoubleParametersProtocol {
    var doubleParameters: DoubleParameters? { get }
    
    func parameters(forAction: String) -> [String]
}

extension DoubleParametersProtocol {
    func parameters(forAction: String) -> [String] {
        return doubleParameters?.parameters(forAction: forAction) ?? []
    }
}

func buildDoubleBlockWithReturn<R>(forAction: String, _ block: @escaping () -> (R)) -> DoubleBlockWithReturn<R> {
    return DoubleBlockWithReturn(actionName: forAction, blockWithReturn: block)
}

func buildDoubleBlockWithNoReturn(forAction: String, _ block: @escaping () -> ()) -> DoubleBlockWithNoReturn {
    return DoubleBlockWithNoReturn(actionName: forAction, blockWithNoReturn: block)
}

func buildDoubleParameters(forAction: String, parameters: [String]) -> DoubleParameters {
    return DoubleParameters(actionName: forAction, parameters: parameters)
}

struct DoubleBlockWithReturn<R> {
    let actionName: String
    let blockWithReturn: () -> (R)
    
    func runBlockWithReturn(forAction: String) -> R? {
        if actionName == forAction {
            return blockWithReturn()
        }
        return nil
    }
}

struct DoubleBlockWithNoReturn {
    let actionName: String
    let blockWithNoReturn: () -> ()
    
    func runBlockWithNoReturn(forAction: String) {
        if actionName == forAction {
            blockWithNoReturn()
        }
    }
}

struct DoubleParameters {
    let actionName: String
    let parameters: [String]
    
    func parameters(forAction: String) -> [String] {
        if actionName == forAction {
            return parameters
        }
        return []
    }
}

