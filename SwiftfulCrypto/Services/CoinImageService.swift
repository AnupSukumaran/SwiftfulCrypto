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
    
    private var imageSubscription: AnyCancellable?
    private let coinModel: CoinModel
    private let fileManager = LocalFileManager.shared
    private let fileName = "coin_Images"
    private let imageName: String
    
    init(coinModel: CoinModel) {
        self.coinModel = coinModel
        self.imageName = coinModel.id
        self.getCoinImage()
    }
    
    private func getCoinImage() {
        guard let img = fileManager.getImage(imageName: imageName, folderName: fileName) else {
            debugPrint("<Images> downloaded Images")
            downloadCoinImage()
            return
        }
        debugPrint("<Images> retrieved images from local")
        self.image = img
        
    }
    
    private func downloadCoinImage() {
        guard let url = URL (string: coinModel.image) else { return }
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion(completion:), receiveValue: {[weak self] returnedImage in
                guard let self = self, let downloadedImg = returnedImage else {return}
                self.image = downloadedImg
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadedImg, imageName: self.imageName, folderName: self.fileName)
            })
    }
    
}
