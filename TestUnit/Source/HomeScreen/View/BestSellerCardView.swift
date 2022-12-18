//
//  BestSellerCardView.swift
//  TestUnit
//
//  Created by Mac on 10.12.2022.
//

import SwiftUI


struct BestSellerCardView: View {

    private let title: String
    private let imageUrl: String
    private let price: Int
    private let discountPrice: Int

    @State private var isFavorites: Bool

    init(title: String, imageUrl: String, price: Int, discountPrice: Int, isFavorites: Bool) {
        self.title = title
        self.imageUrl = imageUrl
        self.price = price
        self.discountPrice = discountPrice
        self.isFavorites = isFavorites
    }

    var body: some View {
        ZStack {
            NavigationLink {
                ItemView()
            } label: {
                
                VStack(alignment: .leading) {
                    AsyncImage(url: URL(string: imageUrl)) { image in
                        image.resizable().scaledToFit().clipped()
                    } placeholder: {
                        ProgressView()
                            .progressViewStyle(.circular)
                    }.frame(width: 181, height: 168)

                    HStack(alignment: .bottom) {
                        Text("$\(discountPrice)")
                            .padding(.leading,27)
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                            .fontWeight(.heavy)
                        Text("$\(price)")
                            .padding(.leading, 7)
                            .font(.system(size: 13))
                            .strikethrough()
                            .foregroundColor(Color.gray)
                    }
                    Text(title)
                        .font(.system(size: 10))
                        .foregroundColor(.black)
                        .fontWeight(.light)
                        .padding(.leading, 27)
                }
                .frame(width: 181, height: 227)
                .background(Color.white
                    .cornerRadius(10))
            }
        }
        .overlay(alignment: .topTrailing) {
            Button {
                
            } label: {
                Image(systemName: isFavorites ? "heart.fill" : "heart")
                    .foregroundColor(.orange)
                    .padding()
                    .background(Color.white
                        .clipShape(Circle())
                        .shadow(radius: 5)
                        .frame(width: 30, height: 30))
                    .onTapGesture {
                        isFavorites.toggle()
                    }
                
            }
        }
    }
}


