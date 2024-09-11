//
//  CoinSearch.swift
//  CoinProject
//
//  Created by 전준영 on 9/11/24.
//

import Foundation

struct CoinSearchResponse: Hashable, Codable {
    let coins: [Coin]
}

struct Coin: Hashable, Codable {
    let id: String
    let name: String
    let apiSymbol: String
    let symbol: String
    let marketCapRank: Int?
    let thumb: String
    let large: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, symbol, thumb, large
        case apiSymbol = "api_symbol"
        case marketCapRank = "market_cap_rank"
    }
}
