//
//  ItemViewModel.swift
//  TestUnit
//
//  Created by Mac on 13.12.2022.
//

import SwiftUI

class ItemViewModel: ObservableObject {
    
    @Published var selectedColor: Int = 0
    @Published var selectedMemory: Int = 0
    @Published var itemImages: [Image] = []
    @Published var item: Item = Item(id: "", CPU: "", camera: "", capacity: [""], color: [""], images: [""], isFavorites: false, price: 0, rating: 0, sd: "", ssd: "", title: "")


    private let service: ItemService

    init(service: ItemService) {
        self.service = service
    }

    func getData(completion: @escaping (Result<Item, Error>) -> Void) {
        service.loadItem(completion: completion)
    }

    func getImages(completion: @escaping (Result<UIImage, Error>) -> Void) {
        for imageUrl in item.images {
            service.loadImage(url: imageUrl, completion: completion)
        }
    }
}
