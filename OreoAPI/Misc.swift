//
//  Misc.swift
//  Oreo
//
//  Created by Wirawit Rueopas on 3/6/2561 BE.
//  Copyright © 2561 Wirawit Rueopas. All rights reserved.
//

import Foundation

func unixTimestamp() -> Int {
    return Int(Date().timeIntervalSince1970 * 1000)
}

public struct DecodedStringOf<Decoded : LosslessStringConvertible> : Codable {
    
    public let decoded: Decoded
    
    public init(_ decoded: Decoded) {
        self.decoded = decoded
    }
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.singleValueContainer()
        let decodedString = try container.decode(String.self)
        
        guard let decoded = Decoded(decodedString) else {
            throw DecodingError.dataCorruptedError(
                in: container, debugDescription: """
                The string \(decodedString) is not representable as a \(Decoded.self)
                """
            )
        }
        
        self.decoded = decoded
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(decoded.description)
    }
}
