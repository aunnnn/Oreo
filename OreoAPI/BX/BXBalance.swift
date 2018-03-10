//
//  BXBalance.swift
//  OreoAPI
//
//  Created by Wirawit Rueopas on 3/7/2561 BE.
//  Copyright © 2561 Wirawit Rueopas. All rights reserved.
//

import Foundation

public typealias DecodedFloat = DecodedStringOf<Float>

public struct BXGetBalanceAPIResponse: Decodable {
    public let success: Bool
    public let balance: [String: BXBalance]
}

public struct BXBalance: Decodable {
    public let available: Float
    public let total: Float
    public let openOrders: Int
    public let pendingWithdrawals: Int
    public let pendingDeposits: Int
    
    enum CodingKeys: String, CodingKey {
        case available, total
        case openOrders = "orders"
        case pendingWithdrawals = "withdrawals"
        case pendingDeposits = "deposits"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.available = try container.decode(DecodedFloat.self, forKey: .available).decoded
        self.total = try ((try? container.decode(Float.self, forKey: .total)) ?? (container.decode(DecodedFloat.self, forKey: .total).decoded))
        self.openOrders = try container.decode(Int.self, forKey: .openOrders)
        self.pendingWithdrawals = try container.decode(Int.self, forKey: .openOrders)
        self.pendingDeposits = try container.decode(Int.self, forKey: .openOrders)
    }
}
