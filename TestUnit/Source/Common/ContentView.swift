//
//  ContentView.swift
//  TestUnit
//
//  Created by Mac on 10.12.2022.
//

import SwiftUI

// Используется в качестве заглушки
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .toolbar(.hidden, for: .tabBar)
    }
}
