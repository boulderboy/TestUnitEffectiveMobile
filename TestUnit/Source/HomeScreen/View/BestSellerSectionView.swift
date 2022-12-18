//
//  BestSellerSectionVew.swift
//  TestUnit
//
//  Created by Mac on 10.12.2022.
//

import SwiftUI

private extension CGFloat {
    static let height: CGFloat = 227
    static let horizontalSpacing: CGFloat = 11
}

private extension Int {
    static let itemsPerRow = 2
}

struct BestSellerSectionView: View {
    
    @Binding var cards: [BestSeller]
    
    var body: some View {
        ZStack {
            Color.mainBackgroundColor
            VStack {
                HomeSectionTitle(sectionName: "Best seller")
                VStack(alignment: .leading, spacing: 5) {
                    ForEach(0..<cards.count, id: \.self) { i in
                        if i % .itemsPerRow == 0 {
                            buildView(rowIndex: i)
                        }
                    }
                }
                .padding(.top, 15)
            }
        }
    }
    
    private func buildView(rowIndex: Int) -> BestSellerRowView? {
        var rowCards = [BestSeller]()
        for itemIndex in 0..<Int.itemsPerRow {
            if rowIndex + itemIndex < cards.count {
                rowCards.append(cards[rowIndex + itemIndex])
            }
        }

        guard rowCards.isEmpty == false else { return nil }

        return BestSellerRowView(
            width: 181,
            height: .height,
            horizontalSpacing: .horizontalSpacing,
            bestSellers: rowCards
        )
    }

}
