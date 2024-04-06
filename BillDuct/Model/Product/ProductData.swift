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
    let image: Data?

    init(name: String, type: String, price: Double, tax: Double, image: Data? = nil) {
        self.name = name
        self.type = type
        self.price = price
        self.tax = tax
        self.image = image
    }
}

extension ProductData {
    static var mockData = ProductData(name: "My Product", type: "Special", price: 20, tax: 3)
}
