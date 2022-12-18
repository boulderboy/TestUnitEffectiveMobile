//
//  OptionsSelectorsView.swift
//  TestUnit
//
//  Created by Mac on 11.12.2022.
//

import SwiftUI

struct OptionsSelectorsView: View {
    
    private let options = [
        Option(id: 0, option: "Shop"),
        Option(id: 1, option: "Details"),
        Option(id: 2, option: "Features")
    ]
    
    @State private var selectedOption: Int = 0
    
    var body: some View {
        HStack {
            ForEach(options, id: \.self) { option in
                Button {
                    selectedOption = option.id
                } label: {
                    let isSelected = selectedOption == option.id
                    Text(option.option)
                        .font(.system(size: 23))
                        .fontWeight(isSelected ? .bold : .thin)
                        .underline(isSelected, color: Color.mainOrange)
                        .foregroundColor(.black)
                }
                
                if !(options.firstIndex(of: option) == options.count - 1) {
                    Spacer()
                }
            }
        }
    }
}

