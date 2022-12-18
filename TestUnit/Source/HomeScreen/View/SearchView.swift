//
//  SearchView.swift
//  TestUnit
//
//  Created by Mac on 10.12.2022.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText: String = ""
    
    var body: some View {
        ZStack {
            Color.mainBackgroundColor
            HStack {
                HStack {
                         Image(systemName: "magnifyingglass")
                            .padding(.horizontal)
                            .foregroundColor(.mainOrange)
                         TextField("Search", text: $searchText)
                     }
                    .foregroundColor(.gray)
                    .frame(height: 34)
                    .background(RoundedRectangle(cornerRadius: 70)
                        .fill(.white))
                Color.mainOrange
                    .frame(width: 34, height: 34)
                    .cornerRadius(17)
                    .overlay {
                        Image(systemName: "qrcode")
                            .foregroundColor(.white)
                    }
            }
            .padding(.horizontal)
            
        }
    }
}
