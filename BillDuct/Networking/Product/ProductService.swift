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
        var data = MultiformRequest()
        data.addText(key: "product_name", value: product.name)
        data.addText(key: "product_type", value: product.type)
        data.addText(key: "price", value: product.price.toString)
        data.addText(key: "tax", value: product.tax.toString)
        if let images = product.images {
            for image in images {
                data.addFile(key: "files", fileName: image, fileData: image)
            }
        }
        return try await request(ProductEndpoint.addProduct(requestData: data)) as ProductResponse
    }

}
