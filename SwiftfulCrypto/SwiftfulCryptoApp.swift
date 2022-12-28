//
//  SwiftfulCryptoApp.swift
//  SwiftfulCrypto
//
//  Created by sukumar.sukumaran on 16/12/2022.
//

import SwiftUI

@main
struct SwiftfulCryptoApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    //.navigationBarHidden(true)
            }
        }
    }
}
