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

        return AsyncImage(url: url, content: { image in
            image.resizable().scaledToFill().size(.medium).defaultCornerRadius().clipped()
        }, placeholder: {
            ProgressView()
        })
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

    static var mockProduct = Product(name: "My Product", type: "ABC", image: exampleImage, price: 25.67, tax: 1.345)

}

let exampleImage = "https://vx-erp-product-images.s3.ap-south-1.amazonaws.com/9_1712255073_0_Screenshot_2024-03-29_at_2.14.52_PM.png"
