//
//  CartServices.swift
//  TestUnit
//
//  Created by Mac on 18.12.2022.
//

import Foundation

protocol CartService {
    func loadCart(completion: @escaping (Result<Cart, Error>) -> Void)
}

final class CartServiceImpl: CartService {

    private enum URLS {
        static let cart = "https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149"
    }

    private let networkService: Networking

    init(networkService: Networking) {
        self.networkService = networkService
    }

    func loadCart(completion: @escaping (Result<Cart, Error>) -> Void) {
        networkService.request(url: URLS.cart, completion: completion)
    }

}
