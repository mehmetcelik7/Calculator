//
//  ComputationView.swift
//  Calculator
//
//  Created by mehmet Çelik on 27.02.2025.
//

import SwiftUI

struct ComputationView: View {
       let currentComputation: String
       let mainResult: String
    var body: some View {
        VStack(spacing: 10) {
            
            HStack {
                Spacer()
                Text(currentComputation)
                    .foregroundColor(foregroundDigitsColor)
                    .lineLimit(1)
            }
            .minimumScaleFactor(0.1)
            
            HStack {
                Spacer()
                Text(mainResult)
                    .foregroundColor(foregroundDigitsColor)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .lineLimit(1)
            }
            .minimumScaleFactor(0.1)
        }.padding(.horizontal)
    }
}

#Preview {
    VStack {
        Spacer()
        ComputationView(currentComputation: "12000+926", mainResult: "12936")
        Spacer()
        ComputationView(currentComputation: "76%", mainResult: "0.76")
        Spacer()
        ComputationView(currentComputation: "12*11", mainResult: "132")
        Spacer()

    }
}
