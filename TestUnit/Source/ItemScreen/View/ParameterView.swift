//
//  PrarmetrrView.swift
//  TestUnit
//
//  Created by Mac on 11.12.2022.
//

import SwiftUI

struct ParameterView: View, Identifiable, Equatable {
    
    let id = UUID().uuidString

    private let imageName: String
    private let parameterLabel: String

    init(imageName: String, parameterLabel: String) {
        self.imageName = imageName
        self.parameterLabel = parameterLabel
    }

    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: imageName)
                .frame(width: 28, height: 28)
                .foregroundColor(.gray)
            Text(parameterLabel)
                .foregroundColor(.gray)
                .font(.system(size: 11))
        }
    }
}

