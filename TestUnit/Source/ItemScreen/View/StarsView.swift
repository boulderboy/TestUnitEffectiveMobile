//
//  StarsView.swift
//  TestUnit
//
//  Created by Mac on 11.12.2022.
//

import SwiftUI

struct StarsView: View {
    private var rating: CGFloat
    private var maxRating: Int
    
    init(rating: CGFloat, maxRating: Int) {
        self.rating = rating
        self.maxRating = maxRating
    }

    var body: some View {
        let stars = HStack(spacing: 0) {
            ForEach(0..<maxRating, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 4.5)
            }
        }

        stars.overlay(
            GeometryReader { geometry in
                let width = rating / CGFloat(maxRating) * geometry.size.width
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: width)
                        .foregroundColor(.yellow)
                }
            }
            .mask(stars)
        )
        .foregroundColor(.gray)
    }
}
