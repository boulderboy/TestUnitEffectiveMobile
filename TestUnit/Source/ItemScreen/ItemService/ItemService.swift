//
//  ItemServices.swift
//  TestUnit
//
//  Created by Mac on 18.12.2022.
//

import UIKit

protocol ItemService {
    func loadImage(url: String, completion: @escaping (Result<UIImage, Error>) -> Void)
    func loadItem(completion: @escaping (Result<Item, Error>) -> Void)
}

final class ItemServiceImpl: ItemService {

    private enum URLS {
        static let item = "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"
    }

    private let networkService: Networking

    init(networkService: Networking) {
        self.networkService = networkService
    }

    func loadItem(completion: @escaping (Result<Item, Error>) -> Void) {
        networkService.request(url: URLS.item, completion: completion)
    }

    func loadImage(url: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        networkService.requestData(url: url) { result in
            switch result {
            case .success(let data):
                guard let data = data else { return }
                guard let image = UIImage(data: data) else { return }
                DispatchQueue.main.async {
                    completion(.success(image))
                }

            case .failure(let error):
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }

}
