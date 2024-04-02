//
//  ProductData.swift
//  BillDuct
//
//  Created by Raj Raval on 02/04/24.
//

import Foundation

struct ProductData: Codable {
    let name: String
    let type: String
    let price: Double
    let tax: Double
    let images: [String]?

    init(name: String, type: String, price: Double, tax: Double, images: [String]? = nil) {
        self.name = name
        self.type = type
        self.price = price
        self.tax = tax
        self.images = images
    }
}

extension ProductData {
    static var mockData = ProductData(name: "My Product", type: "Special", price: 20, tax: 3)
}
