//
//  TopCoin.swift
//  CoinProject
//
//  Created by 전준영 on 9/11/24.
//

import Foundation

struct TopCoinsResponse: Codable {
    let coins: [CoinItem]
    let nfts: [NftItem]
}

struct CoinItem: Codable, Hashable {
    let item: TopCoin
}

struct TopCoin: Codable, Hashable {
    let id: String
    let coinID: Int
    let name: String
    let symbol: String
    let marketCapRank: Int
    let thumb: String
    let small: String
    let large: String
    let slug: String
    let score: Int
    let data: CoinData?
    
    enum CodingKeys: String, CodingKey {
        case id
        case coinID = "coin_id"
        case name
        case symbol
        case marketCapRank = "market_cap_rank"
        case thumb
        case small
        case large
        case slug
        case score
        case data
    }
}

struct CoinData: Codable, Hashable {
    let price: Double?
    let priceBTC: String?
    let priceChangePercentage24H: [String: Double]?
    let marketCap: String?
    let marketCapBTC: String?
    let totalVolume: String?
    let totalVolumeBTC: String?
    let sparkline: String?

    enum CodingKeys: String, CodingKey {
        case price
        case priceBTC = "price_btc"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCap = "market_cap"
        case marketCapBTC = "market_cap_btc"
        case totalVolume = "total_volume"
        case totalVolumeBTC = "total_volume_btc"
        case sparkline
    }
}

struct NftItem: Codable, Hashable {
    let id: String
    let name: String
    let symbol: String
    let thumb: String
    let nftContractID: Int
    let nativeCurrencySymbol: String
    let floorPriceInNativeCurrency: Double
    let floorPrice24hPercentageChange: Double
    let data: NftData?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case symbol
        case thumb
        case nftContractID = "nft_contract_id"
        case nativeCurrencySymbol = "native_currency_symbol"
        case floorPriceInNativeCurrency = "floor_price_in_native_currency"
        case floorPrice24hPercentageChange = "floor_price_24h_percentage_change"
        case data
    }
}

struct NftData: Codable, Hashable {
    let floorPrice: String
    let floorPriceInUsd24hPercentageChange: String
    let h24Volume: String
    let h24AverageSalePrice: String
    let sparkline: String?
    let content: String?

    enum CodingKeys: String, CodingKey {
        case floorPrice = "floor_price"
        case floorPriceInUsd24hPercentageChange = "floor_price_in_usd_24h_percentage_change"
        case h24Volume = "h24_volume"
        case h24AverageSalePrice = "h24_average_sale_price"
        case sparkline
        case content
    }
}
