//
//  AddProductViewModel.swift
//  BillDuct
//
//  Created by Raj Raval on 02/04/24.
//

import Foundation

final class AddProductViewModel: ObservableObject {

    @Published var productResponse: ProductResponse?

    private var productService: ProductService!

    init(_ productService: ProductService = ProductService()) {
        self.productService = productService
    }

    @MainActor
    func addProduct(_ product: ProductData) {
        Task {
            do {
                productResponse = try await productService.addProduct(product)
            } catch let error {
                Log.error(error)
            }
        }
    }

}
