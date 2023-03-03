//
//  Model.swift
//  TestingPERTAMA
//
//  Created by M. Syulhan Al Ghofany on 02/03/23.
//

import Foundation


struct Products: Decodable {
    var products: [DataProduct]
}

struct DataProduct: Decodable {
    let id: Int
    let title: String
    let description: String
    let price: Int
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: String
    let images: [String]
}
