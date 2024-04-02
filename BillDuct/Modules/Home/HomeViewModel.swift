//
//  HomeViewModel.swift
//  BillDuct
//
//  Created by Raj Raval on 02/04/24.
//

import Foundation

final class HomeViewModel: ObservableObject {

    @Published var products: [Product] = []

    private var productService: ProductService!

    init(productService: ProductService = ProductService()) {
        self.productService = productService
    }

    @MainActor
    func fetchProducts() {
        Task {
            do {
                products = try await productService.getProducts()
            } catch let error {
                Log.error(error)
            }
        }
    }

}
