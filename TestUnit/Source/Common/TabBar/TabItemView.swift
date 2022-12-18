//
//  TabItemView.swift
//  TestUnit
//
//  Created by Mac on 12.12.2022.
//

import SwiftUI

struct TabItemData {
    let image: String
    let title: String
}

struct TabItemView: View {
    
    private let data: TabItemData
    private let isSelected: Bool

    init(data: TabItemData, isSelected: Bool) {
        self.data = data
        self.isSelected = isSelected
    }
    
    var body: some View {
        if isSelected {
            HStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 8, height: 8)
                Text(data.title)
                    .foregroundColor(.white)
                    .font(.system(size: 17))
            }
        } else {
            Image(data.image)
                .renderingMode(.template)
                .resizable()
                .foregroundColor(.white)
                .frame(width: 18, height: 18)
        }
    }
}
