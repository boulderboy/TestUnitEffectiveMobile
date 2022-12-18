//
//  CartItemView.swift
//  TestUnit
//
//  Created by Mac on 13.12.2022.
//

import SwiftUI

struct CartItemView: View {

    private let title: String
    private let price: Int
    private let imageUrl: String

    @State private var itemCount: Int = 1

    init(title: String, price: Int, imageUrl: String) {
        self.title = title
        self.price = price
        self.imageUrl = imageUrl
    }
    
    var body: some View {
  
            HStack {
                AsyncImage(url: URL(string: imageUrl)) { image in
                    image.resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(.circular)
                } .frame(width: 89, height: 89)
                    .cornerRadius(10)

                VStack(alignment: .leading) {
                    Text(title)
                        .font(.system(size: 22))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .lineLimit(10)
                    Text("$\(price)")
                        .font(.system(size: 22))
                        .foregroundColor(Color.mainOrange)
                        .fontWeight(.semibold)
                }
                Spacer()
                VStack {
                    Button {
                        itemCount += 1
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                    }
                    .padding(.vertical, 1)
                    
                    Text("\(itemCount)")
                        .foregroundColor(.white)
                    
                    Button {
                        itemCount -= 1
                    } label: {
                        Image(systemName: "minus")
                            .foregroundColor(.white)
                    }
                    .padding(.vertical, 1)

                }
                .frame(width: 26, height: 88)
                .background(Color.stepperBackground.cornerRadius(26))
                .padding(.trailing, 17)
                Image(systemName: "trash")
                    .foregroundColor(Color.stepperBackground)
                    .frame(width: 15, height: 15)
            }
    }
}
