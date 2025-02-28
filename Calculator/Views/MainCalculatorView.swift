//
//  ContentView.swift
//  Calculator
//
//  Created by mehmet Çelik on 27.02.2025.
//

import SwiftUI

struct MainCalculatorView: View {
    @State var lightMode:Bool = true
    @State var currentComputation: String = ""
    @State var mainResult: String = "0"
    var body: some View {
        GeometryReader {
            geometry in
            ZStack {
                primaryBackgroundColor.ignoresSafeArea()
                VStack {
                    
                    SunMoonView(lightMode: lightMode)
                        .onTapGesture {
                            withAnimation {
                                lightMode.toggle()
                            }
                        }
                    
                    
                    Spacer()
                    
                    ComputationView(currentComputation: currentComputation, mainResult: mainResult)
                        .padding(.horizontal, UIDevice.isIpad ? geometry.size.width * 0.1 : 0)
                 
                    Spacer()
                    
                   
                    CalcsButtonView(currentComputation: $currentComputation, mainResult: $mainResult, width: geometry.size.width)
                    
                    if UIDevice.isIpad {
                        Spacer()
                    }
                    
                }
                .padding()
            }
            .environment(\.colorScheme,
                          lightMode ? .light : .dark)
        }
        
    }
}

#Preview {
    MainCalculatorView()
}
