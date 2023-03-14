//
//  HomeViewModel.swift
//  SwiftfulCrypto
//
//  Created by sukumar.sukumaran on 28/12/2022.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var statistics: [StatisticModel] = [
        StatisticModel(title: "Title", value: "Value", percentageChange: 1),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value", percentageChange: -7)
    ]
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchTxt: String = ""
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        // updates all coins
        $searchTxt
            .combineLatest(dataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main )
            .map(filteredCoins)
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
    func filteredCoins(text: String, coinDataArr: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else {
            return coinDataArr
        }
        
        let lowerCasedTxt = text.lowercased()
        
        let filtered = coinDataArr.filter { coin in
            coin.name.lowercased().contains(lowerCasedTxt) ||
            coin.id.lowercased().contains(lowerCasedTxt) ||
            coin.symbol .lowercased().contains(lowerCasedTxt)
        }
        
        return filtered
    }
}
