//
//  ItemView.swift
//  TestUnit
//
//  Created by Mac on 11.12.2022.
//

import SwiftUI
import ACarousel



struct CarouselView: View {
    let images: [Image]
    
    
    var body: some View {
        let items = images.map({ CarouselItem(image: $0) })
        ACarousel(
            items,
            spacing: 27,
            headspace: 27
        ) { item in
            item.image
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 350)
                .cornerRadius(30)
        }
        .frame(height: 349)
        .shadow(radius: 10, x: 10, y: 10)
    }
}

private extension CarouselView {
    struct CarouselItem: Identifiable {
        let id = UUID()
        let image: Image
    }
}
