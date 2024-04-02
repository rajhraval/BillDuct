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
            return Image(systemName: "")
        }
        return AsyncImage(url: url) { image in
            image
        } placeholder: {
            ProgressView()
        }
    }
}
