//
//  BXService.swift
//  CryptoPortfolio
//
//  Created by Wirawit Rueopas on 3/3/2561 BE.
//  Copyright © 2561 Wirawit Rueopas. All rights reserved.
//

import JustRequest
import Prelude
import Arcane

public struct BXAuthentication {
    public let apiKey: String
    public let apiSecret: String
    
    public init(apiKey: String, apiSecret: String) {
        self.apiKey = apiKey
        self.apiSecret = apiSecret
    }
}


enum BXAPI {
    case getBalance(auth: BXAuthentication)
}

// Utilities
private extension BXAPI {
    static func authFields(_ auth: BXAuthentication) -> [String: Any] {
        let nonce = unixTimestamp()
        return [
            "key": auth.apiKey,
            "nonce": nonce,
            "signature": Hash.SHA256("\(auth.apiKey)\(nonce)\(auth.apiSecret)")!,
        ]
    }
}

extension BXAPI: APIService {
    
    var baseURL: URL {
        return URL(string: "https://bx.in.th/api")!
    }
    
    var method: HTTPMethod {
        return .post(.url)
    }
    
    var path: String {
        switch self {
        case .getBalance:
            return "/balance/"
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .getBalance(let auth):
            return BXAPI.authFields(auth)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
