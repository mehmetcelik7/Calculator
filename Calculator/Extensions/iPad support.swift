//
//  iPad support.swift
//  Calculator
//
//  Created by mehmet Çelik on 28.02.2025.
//

import Foundation
import SwiftUI

extension UIDevice {
    static var isIpad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    static var isIphone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
    
}

