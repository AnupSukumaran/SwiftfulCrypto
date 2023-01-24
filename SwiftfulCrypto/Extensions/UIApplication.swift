//
//  UIApplication.swift
//  SwiftfulCrypto
//
//  Created by sukumar.sukumaran on 15/01/2023.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIApplication.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
