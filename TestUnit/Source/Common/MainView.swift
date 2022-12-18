//
//  MainView.swift
//  TestUnit
//
//  Created by Mac on 12.12.2022.
//

import SwiftUI

struct MainView: View {
    @State private var selectedIndex: Int = 0

    var body: some View {
        CustomTabView(tabs: TabType.allCases.map({ $0.tabItem }), selectedIndex: $selectedIndex) { index in
            let type = TabType(rawValue: index) ?? .explorer
            getTabView(type: type)
        }
    }
    
    @ViewBuilder
    func getTabView(type: TabType) -> some View {
        switch type {
        case .explorer:
            HomeView()
                .padding(.bottom, 25)
        case .cart:
            CartView()
        case .profile:
            ContentView()
        case .favorite:
            ContentView()
        }
        
    }
}
