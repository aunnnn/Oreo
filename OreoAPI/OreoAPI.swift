//
//  OreoAPI.swift
//  OreoAPI
//
//  Created by Wirawit Rueopas on 3/7/2561 BE.
//  Copyright © 2561 Wirawit Rueopas. All rights reserved.
//

import JustRequest

public typealias CompletionHandler<T: Decodable> = (Result<T>) -> Void

public struct OreoAPI {
    public struct bx {}
    public struct bittrex {}
    public struct binance {}
}

public extension OreoAPI.bx {
    static func getBalance(auth: BXAuthentication, completion: @escaping CompletionHandler<BXGetBalanceAPIResponse>) {
        BXAPI.getBalance(auth: auth).just.response { (res) in
            switch res {
            case .success(let data):
                print("Raw data: \(String.init(data: data, encoding: .utf8)!)")
                
            case .error(let error):
                print("Debug: \(error)")
            }
        }
        BXAPI.getBalance(auth: auth).just.responseObject(completion)
    }
}
