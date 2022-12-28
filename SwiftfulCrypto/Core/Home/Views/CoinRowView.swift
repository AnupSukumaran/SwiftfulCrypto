//
//  CoinRowView.swift
//  SwiftfulCrypto
//
//  Created by sukumar.sukumaran on 27/12/2022.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel
        
    var body: some View {
        HStack(spacing: 0) {
            Text(String(coin.rank))
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 30)
            Circle()
                .frame(width: 30, height: 30)
            Text(String(coin.symbol.uppercased()))
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(Color.theme.accent)
            Spacer()
            VStack(alignment: .trailing) {
                Text(coin.currentPrice.asCurrencyWith6Decimals())
                    .bold()
                    .foregroundColor(Color.theme.accent)
                Text(coin.priceChangePercentage24H?.asPercentageString() ?? "")
                    .foregroundColor(
                        (coin.priceChangePercentage24H ?? 0) >= 0 ?
                            Color.theme.green :
                            Color.theme.red
                    )
            }
        }
        
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: dev.coin)
    }
}
