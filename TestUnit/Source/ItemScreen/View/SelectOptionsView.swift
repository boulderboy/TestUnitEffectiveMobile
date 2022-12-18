//
//  SelectOptionsView.swift
//  TestUnit
//
//  Created by Mac on 11.12.2022.
//

import SwiftUI

struct SelectOptionsView: View {
    
    @Binding var item: Item
    @Binding var selectedColor: Int
    @Binding var selectedCapacity: Int
    
    var body: some View {
        HStack{
            ForEach(item.color, id: \.self){ color in
                let currentColorId = item.color.firstIndex(of: color)

                    Color.init(hex: color)
                        .cornerRadius(20)
                        .overlay {
                            
                            if currentColorId == selectedColor{
                                Image(systemName: "checkmark")
                                    .foregroundColor(.white)
                            }
                        }
                        .onTapGesture {
                            selectedColor = currentColorId ?? 0
                        }
                }
                .frame(width: 40, height: 40)

            Spacer()

            ForEach(item.capacity, id:\.self){ capacity in
                let currentCapacityId = item.capacity.firstIndex(of: capacity)
                let isSelected = currentCapacityId == selectedCapacity
                ZStack {
                    if isSelected {
                        Color.mainOrange.cornerRadius(10)
                            .frame(width: 71, height: 30)
                    }
                    Text("\(capacity) GB")
                            .font(.system(size: 13))
                            .foregroundColor(isSelected ? .white : .gray)
                            .padding(.horizontal, 15)
                        .padding(.vertical, 8)
                }
                .onTapGesture {
                    selectedCapacity = currentCapacityId ?? 0
                }
                        
                }
                .padding(.horizontal, 10)
        }
    }
}

