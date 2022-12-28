//
//  ContentView.swift
//  SwiftfulCrypto
//
//  Created by sukumar.sukumaran on 16/12/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Text("Accent Color")
                    .foregroundColor(Color.theme.accent)
                
                Text("Secondary Text")
                    .foregroundColor(Color.theme.secondaryText)
                
                Text("Red Color")
                    .foregroundColor(Color.theme.red)
                
                Text("Green Color")
                    .foregroundColor(Color.theme.green)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
