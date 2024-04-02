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
    let images: [String]?
    let price: Double
    let tax: Double
}
