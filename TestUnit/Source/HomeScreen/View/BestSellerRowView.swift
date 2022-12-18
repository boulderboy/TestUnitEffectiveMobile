//
//  BestSellerRowView.swift
//  TestUnit
//
//  Created by Mac on 10.12.2022.
//

import SwiftUI

struct BestSellerRowView: View {
    
    private let width: CGFloat
    private let height: CGFloat
    private let horizontalSpacing: CGFloat

    @State private var bestSellers: [BestSeller]

    init(width: CGFloat, height: CGFloat, horizontalSpacing: CGFloat, bestSellers: [BestSeller]) {
        self.width = width
        self.height = height
        self.horizontalSpacing = horizontalSpacing
        self.bestSellers = bestSellers
    }

    var body: some View {
        HStack(spacing: horizontalSpacing) {
            ForEach($bestSellers, id: \.self) { bestSeller in
                let value = bestSeller.wrappedValue
                BestSellerCardView(
                    title: value.title,
                    imageUrl: value.picture,
                    price: value.priceWithoutDiscount,
                    discountPrice: value.discountPrice,
                    isFavorites: value.isFavorites
                )
                    .frame(width: width, height: height)
            }
        }
        .padding(.vertical, 6)
    }
}
