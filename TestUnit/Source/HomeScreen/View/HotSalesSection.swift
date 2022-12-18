//
//  HotSalesSection.swift
//  TestUnit
//
//  Created by Mac on 10.12.2022.
//

import SwiftUI

struct HotSalesSection: View {
    
    @Binding var hotSales: [HotSale]
    
    var body: some View {
        VStack(spacing: 0) {
            HomeSectionTitle(sectionName: "Hot sales")
            TabView {
                ForEach(hotSales) { sale in
                    HotSaleCard(url: sale.picture, title: sale.title, description: sale.subtitle)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 190)
        }
    }
}

private struct HotSaleCard: View {
    
    private let url: String
    private let title: String
    private let description: String

    init(url: String, title: String, description: String) {
        self.url = url
        self.title = title
        self.description = description
    }
    
    var body: some View {
        ZStack(alignment: .leading) {

            AsyncImage(url: URL(string: url)) { image in
                image.resizable().scaledToFill()
            } placeholder: {
                ProgressView()
                    .progressViewStyle(.circular)
            }
            .frame(maxWidth: UIScreen.main.bounds.width - 34, maxHeight: 180)
            .cornerRadius(15)
                
            TextForImage(title: title, description: description)
        }
    }
}

private struct TextForImage: View {
    
    private let title: String
    private let description: String

    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("New")
                    .foregroundColor(.white)
                    .font(.system(size: 10))
                    .fontWeight(.bold)
                    .frame(width: 27, height: 27)
                    .background(Circle()
                        .fill(Color.mainOrange))
                    .padding(.top, 23)
                Spacer()
                Text(title)
                    .padding(.top, 18)
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .underline()
                Text(description)
                    .font(.system(size: 11))
                    .foregroundColor(.white)
                    .padding(.bottom, 26)
                Spacer()
                Button {
                    
                } label: {
                    Text("Buy now!")
                        .padding(.vertical, 5)
                        .padding(.horizontal, 27)
                        .font(.system(size: 11))
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .background(Color.white
                            .cornerRadius(5))
                }
                .padding(.bottom, 34)
            }
            .padding(.horizontal, 32)
            Spacer()
        }
    }
}
