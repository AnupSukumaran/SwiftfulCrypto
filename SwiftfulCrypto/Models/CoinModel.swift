//
//  CoinModel.swift
//  SwiftfulCrypto
//
//  Created by sukumar.sukumaran on 17/12/2022.
//


import Foundation

// CoinGecko API Model
/*
 URL:
 
 https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=false&price_change_percentage=24h
 
 [
 
    {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
     "current_price": 13721.39,
     "market_cap": 264189491541,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 288412727136,
     "total_volume": 19352822555,
     "high_24h": 14031.3,
     "low_24h": 13633.78,
     "price_change_24h": -222.044316129648,
     "price_change_percentage_24h": -1.59247,
     "market_cap_change_24h": -4083496683.7225037,
     "market_cap_change_percentage_24h": -1.52214,
     "circulating_supply": 19236250,
     "total_supply": 21000000,
     "max_supply": 21000000,
     "ath": 51032,
     "ath_change_percentage": -73.09345,
     "ath_date": "2021-11-10T14:24:11.849Z",
     "atl": 43.9,
     "atl_change_percentage": 31176.23735,
     "atl_date": "2013-07-05T00:00:00.000Z",
     "roi": null,
     "last_updated": "2022-12-17T13:53:26.999Z",
     "sparkline_in_7d": {
       "price": [
         17170.61208637136,
         17162.91840049762
       ]
     },
     "price_change_percentage_24h_in_currency": -1.5924652277503997
   }
 
 ]
 
 */

struct CoinModel: Identifiable, Codable {
    
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank: Double?
    let fullyDilutedValuation: Double?
    let totalVolume: Double?
    let high24H, low24H, priceChange24H, priceChangePercentage24H: Double?
    let marketCapChange24H, marketCapChangePercentage24H: Double?
    let circulatingSupply: Double?
    let totalSupply, maxSupply: Double?
    let ath, athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let currentHoldings: Double?
    
    var currentHoldingsValue: Double {
        return (currentHoldings ?? 0) * currentPrice
    }
    
    var rank: Int {
        return Int(marketCapRank ?? 0)
    }

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case currentHoldings
    }
    
    
    func updateHoldings(amount: Double) -> CoinModel {
        return CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency, currentHoldings: amount)
    }
}

// MARK: - SparklineIn7D
struct SparklineIn7D: Codable {
    let price: [Double]?
}



