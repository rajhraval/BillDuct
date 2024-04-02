//
//  AddProductView.swift
//  BillDuct
//
//  Created by Raj Raval on 02/04/24.
//

import SwiftUI

struct AddProductView: View {

    @StateObject private var viewModel = AddProductViewModel()

    var body: some View {
        NavigationStack {
            if let response = viewModel.productResponse {
                Text(response.product.name)
            } else {
                Button("Add Product") {
                    viewModel.addProduct(.mockData)
                }
            }
        }
    }
}

#Preview {
    AddProductView()
}
