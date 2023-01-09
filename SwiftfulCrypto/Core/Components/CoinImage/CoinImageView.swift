//
//  CoinImageView.swift
//  SwiftfulCrypto
//
//  Created by sukumar.sukumaran on 02/01/2023.
//

import SwiftUI

struct CoinImageView: View {
    
    @StateObject var viewModel: CoinImageViewModel
    
    init(coin: CoinModel) {
        _viewModel = StateObject(wrappedValue: CoinImageViewModel(coinModel: coin))
    }
    
    var body: some View {
        ZStack {
            if let img = viewModel.image {
                Image(uiImage: img)
                    .resizable()
                    .scaledToFit()
            } else if viewModel.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}

struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageView(coin: dev.coin)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
