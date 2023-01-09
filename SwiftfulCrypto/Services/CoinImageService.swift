//
//  CoinImageService.swift
//  SwiftfulCrypto
//
//  Created by sukumar.sukumaran on 09/01/2023.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    var imageSubscription: AnyCancellable?
    var coinModel: CoinModel
    
    init(coinModel: CoinModel) {
        self.coinModel = coinModel
        getCoinImage()
    }
    
    private func getCoinImage() {
        guard let url = URL (string: coinModel.image) else { return }
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion(completion:), receiveValue: {[weak self] returnedImage in
                self?.image = returnedImage
                self?.imageSubscription?.cancel()
            })
    }
    
}
