//
//  APIService.swift
//  CryptoPortfolio
//
//  Created by Wirawit Rueopas on 3/3/2561 BE.
//  Copyright © 2561 Wirawit Rueopas. All rights reserved.
//

import JustRequest

protocol APIService {
    var baseURL: URL { get }
    var method: HTTPMethod  { get }
    var path: String { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
}

extension APIService {
    var just: Request {
        let url = baseURL.appendingPathComponent(path)
        return Just.request(url, method: method, parameters: parameters, headers: headers)
    }
}
