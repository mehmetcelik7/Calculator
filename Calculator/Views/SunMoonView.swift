//
//  SunMoonView.swift
//  Calculator
//
//  Created by mehmet Çelik on 27.02.2025.
//

import SwiftUI

struct SunMoonView: View {
    var lightMode:Bool
    
    var body: some View {
        HStack(spacing: 30) {
            Image(systemName: "sun.min")
                .foregroundColor(lightMode ? sunOrMoonSelectedColor : sunOrMoonNotSelectedColor)
            
            
            Image(systemName: "moon")
                .foregroundColor(lightMode ? sunOrMoonNotSelectedColor :sunOrMoonSelectedColor )
                
        }
        .imageScale(.large)
        .font(UIDevice.isIpad ? .title : .body)
        .fontWeight(UIDevice.isIpad ? .semibold : .regular)
        .padding()
        .background(secondaryBackgroundColor)
        .cornerRadius(20)
    }
}

#Preview {
    VStack {
        SunMoonView(lightMode: true)
        SunMoonView(lightMode: false)

    }
}
