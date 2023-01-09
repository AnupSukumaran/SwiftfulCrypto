//
//  CoinImageViewModel.swift
//  SwiftfulCrypto
//
//  Created by sukumar.sukumaran on 09/01/2023.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    var coinModel: CoinModel
    var dataService: CoinImageService
    var cancellables = Set<AnyCancellable>()
    
    init(coinModel: CoinModel) {
        self.coinModel = coinModel
        self.dataService = CoinImageService(coinModel: coinModel)
        self.addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$image
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] imageVal in
                self?.image = imageVal
            }
            .store(in: &cancellables)
    }
}
