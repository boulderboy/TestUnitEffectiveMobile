//
//  ItemModel.swift
//  TestUnit
//
//  Created by Mac on 11.12.2022.
//

import Foundation

struct Item: Codable, Equatable {
    
    let id: String
    let CPU: String
    let camera: String
    let capacity: [String]
    let color: [String]
    let images: [String]
    let isFavorites: Bool
    let price: Int
    let rating: Double
    let sd: String
    let ssd: String
    let title: String
}
