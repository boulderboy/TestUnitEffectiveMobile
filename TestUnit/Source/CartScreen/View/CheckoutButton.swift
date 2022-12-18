//
//  CheckoutButton.swift
//  TestUnit
//
//  Created by Mac on 13.12.2022.
//

import SwiftUI

struct CheckoutButton: View {
    var body: some View {
        Button {
            // Do nothing
        } label: {
            Text("Checkout")
                .frame(width: 326, height: 54)
                .background(Color.mainOrange.cornerRadius(10))
                .font(.system(size: 22))
                .foregroundColor(.white)
                .fontWeight(.semibold)
        }
    }
}
