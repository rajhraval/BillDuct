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

    var disableAddButton: Bool {
        name.isEmpty || type.isEmpty || price.isEmpty
    }

    private var productService: ProductService!
    private var cancellables = Set<AnyCancellable>()

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
