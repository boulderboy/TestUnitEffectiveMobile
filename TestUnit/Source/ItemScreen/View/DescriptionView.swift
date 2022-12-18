//
//  DescriptionView.swift
//  TestUnit
//
//  Created by Mac on 11.12.2022.
//

import SwiftUI

struct DescriptionView: View {
    
    @Binding var item: Item
    @Binding var selectedColor: Int
    @Binding var selectedCapacity: Int
    
    var body: some View {
        
        ZStack {
            Color.mainBackgroundColor
            ZStack {
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text(item.title)
                            .font(.system(size: 26))
                        .fontWeight(.regular)
                        Spacer()
                        Button {
                            
                        } label: {
                            Image(systemName: "heart")
                                .foregroundColor(.white)
                                .fontWeight(.thin)
                                .background(Color.darkViolet
                                    .frame(width: 32, height: 32)
                                    .cornerRadius(10))
                        }

                    }
                    .padding(.top, 28)
                    StarsView(rating: 4.5, maxRating: 5)
                        .frame(width: 110, height: 18)
                    OptionsSelectorsView()
                        .padding(.top, 32)
                    InfoPicturesView(item: $item)
                        .padding(.top, 33)
                    Text("Select color and capacity")
                        .font(.system(size: 16))
                        .padding(.top, 29)
                    SelectOptionsView(item: $item, selectedColor: $selectedColor, selectedCapacity: $selectedCapacity)
                        .padding(.top, 18)
                    AddButtonView(price: item.price)
                        .padding(.vertical, 27)
                }
                .padding(.horizontal, 38)
            }
            .frame(maxWidth: .infinity, maxHeight: 471)
            .background(Color.white.cornerRadius(30))
        }
    }
}

