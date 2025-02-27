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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    MainCalculatorView()
}
