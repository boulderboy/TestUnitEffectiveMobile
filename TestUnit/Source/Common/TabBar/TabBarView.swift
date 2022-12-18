//
//  TabBarView.swift
//  TestUnit
//
//  Created by Mac on 12.12.2022.
//

import SwiftUI

struct TabBarView: View {
    
    let tabItems: [TabItemData]
    @Binding var selectedIndex: Int
    
    var body: some View {
        HStack {
            Spacer()
            ForEach(tabItems.indices, id: \.self) { index in
                let item = tabItems[index]
                Button {
                    self.selectedIndex = index
                } label: {
                    let isSelected = selectedIndex == index
                    TabItemView(data: item, isSelected: isSelected)
                }
                Spacer()
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: 72)
        .background(
            Color.darkViolet
                .cornerRadius(30))
    }
}

