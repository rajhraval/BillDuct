//
//  Product.swift
//  BillDuct
//
//  Created by Raj Raval on 02/04/24.
//

import Foundation
import SwiftUI

struct Product: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let image: String
    let price: Double
    let tax: Double

    enum CodingKeys: String, CodingKey {
        case image, tax, price
        case name = "product_name"
        case type = "product_type"
    }

    var productImage: any View {
        guard let url = URL(string: image) else {
            return Image(.placeholder).resizable().scaledToFit().size(.medium)
        }
        return BDAsyncImage(url: image).size(.medium).defaultCornerRadius().clipped()
    }
}

enum ProductType: String, Identifiable, CaseIterable {
    case digitalItem
    case physicalItem
    case deliveryItem

    var display: String {
        switch self {
        case .digitalItem:
            return "Digital Item"
        case .physicalItem:
            return "Physical Item"
        case .deliveryItem:
            return "Delivery Item"
        }
    }

    var id: Self {
        return self
    }
}

extension Product {

    static var mockProduct = Product(name: "My Product", type: "ABC", image: "", price: 25.67, tax: 1.345)

}
