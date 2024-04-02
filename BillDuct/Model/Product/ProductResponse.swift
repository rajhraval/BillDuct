//
//  ProductResponse.swift
//  BillDuct
//
//  Created by Raj Raval on 02/04/24.
//

import Foundation

struct ProductResponse: Identifiable, Codable {
    let id: Int
    let message: String
    let product: Product
    let success: Bool

    enum CodingKeys: String, CodingKey {
        case id, message, success
        case product = "product_details"
    }
}
