//
//  Cart.swift
//  TestUnit
//
//  Created by Mac on 13.12.2022.
//

import Foundation

struct Cart: Codable {
    let basket: [CartItem]
    let delivery: String
    let id: String
    let total: Int
}

struct CartItem: Codable, Identifiable {
    let id: Int
    let images: String
    let title: String
    let price: Int
}

extension Cart {
    static let empty: Cart = Cart(basket: [CartItem(id: 0, images: "", title: "", price: 0)], delivery: "", id: "", total: 0)
}
