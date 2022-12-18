//
//  CartViewModel.swift
//  TestUnit
//
//  Created by Mac on 13.12.2022.
//

import SwiftUI

final class CartViewModel: ObservableObject {
    
    @Published var cart: Cart = Cart.empty
    var cartItem: [CartItem] = []


    private let service: CartService

    init(service: CartService) {
        self.service = service

        getItems { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let cart):
                DispatchQueue.main.async {
                    self.cart = cart
                }
            }
        }
    }
    
    private func getItems(completion: @escaping (Result<Cart, Error>) -> Void) {
        service.loadCart(completion: completion)
    }
}

