//
//  AddProductViewModel.swift
//  BillDuct
//
//  Created by Raj Raval on 02/04/24.
//

import Combine
import Foundation
import UIKit.UIImage

final class AddProductViewModel: ObservableObject {

    @Published var productResponse: ProductResponse?

    @Published var name: String = ""
    @Published var type: String = ""
    @Published var price: String = ""
    @Published var tax: String = ""
    @Published var images: [UIImage] = []

    @Published var isNameEmpty = false
    @Published var isTypeEmpty = false
    @Published var isPriceEmpty = false

    var disableAddButton: Bool {
        isNameEmpty || isTypeEmpty || isPriceEmpty
    }

    private var productService: ProductService!
    private var cancellables = Set<AnyCancellable>()

    init(_ productService: ProductService = ProductService()) {
        self.productService = productService
        handleFields()
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

    private func handleFields() {
        $name.isEmpty.assign(to: \.isNameEmpty, on: self).store(in: &cancellables)
        $type.isEmpty.assign(to: \.isTypeEmpty, on: self).store(in: &cancellables)
        $price.isEmpty.assign(to: \.isPriceEmpty, on: self).store(in: &cancellables)
    }

}
