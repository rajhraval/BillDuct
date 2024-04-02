//
//  ProductService.swift
//  BillDuct
//
//  Created by Raj Raval on 02/04/24.
//

import Foundation

final class ProductService: API {

    func getProducts() async throws -> [Product] {
        try await request(ProductEndpoint.getProducts) as [Product]
    }

    func addProduct(_ product: ProductData) async throws -> ProductResponse {
        let data = MultiformRequest()
        return try await request(ProductEndpoint.addProduct(data: data)) as ProductResponse
    }

}
