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

    @Published var productResponse: ProductResponse? = nil
    @Published var loadingState: LoadingState = .idle

    @Published var name: String = ""
    @Published var type: String = ""
    @Published var price: String = ""
    @Published var tax: String = ""
    @Published var images: [UIImage] = []

    @Published var isLoading: Bool = false

    var disableAddButton: Bool {
        name.isEmpty || type.isEmpty || price.isEmpty
    }

    private var productService: ProductService!
    private var cancellables = Set<AnyCancellable>()

    init(_ productService: ProductService = ProductService()) {
        self.productService = productService
    }

    @MainActor
    func addProduct() {
        isLoading = true
        loadingState = .loading
        let imagesData = images.isEmpty ? nil : images.toPNGData
        let product = ProductData(name: name, type: type, price: price.toDouble, tax: tax.toDouble, images: imagesData)
        Task {
            do {
                productResponse = try await productService.addProduct(product)
                loadingState = .idle
                isLoading = false
            } catch let error as APIError {
                isLoading = false
                loadingState = .error(type: error)
                Log.error(error)
            }
        }
    }

    func removeImage(_ image: UIImage) {
        if let index = images.firstIndex(where: { $0 == image }) {
            images.remove(at: index)
        }
    }

    func resetValues() {
        name = ""
        type = ""
        price = ""
        tax = ""
        images = []
        productResponse = nil
    }

}
