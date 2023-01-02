//
//  CoinImageView.swift
//  SwiftfulCrypto
//
//  Created by sukumar.sukumaran on 02/01/2023.
//

import SwiftUI

class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    init() {
        getImage()
    }
    
    func getImage() {
        
    }
}

struct CoinImageView: View {
    
    @StateObject var viewModel: CoinImageViewModel = CoinImageViewModel()
    
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
        CoinImageView()
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
