//
//  AddProductView.swift
//  BillDuct
//
//  Created by Raj Raval on 02/04/24.
//

import SwiftUI

struct AddProductView: View {

    @StateObject private var viewModel = AddProductViewModel()

    @State private var showPhotoPicker = false

    var body: some View {
        NavigationStack {
            VStack {
                TextField("Enter product name", text: $viewModel.name, axis: .vertical)
                TextField("Enter product type", text: $viewModel.type, axis: .vertical)
                TextField("Enter product price", text: $viewModel.price, axis: .vertical).keyboardType(.decimalPad)
                TextField("Enter product tax", text: $viewModel.tax, axis: .vertical).keyboardType(.decimalPad)
                if !viewModel.images.isEmpty {
                    HStack {
                        ForEach(viewModel.images, id: \.self) { image in
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 72, height: 72)
                        }
                    }
                }
                Button("Select Images") {
                    showPhotoPicker.toggle()
                }
                Button("Add Product") {
                    viewModel.addProduct(.mockData)
                }
                .disabled(viewModel.disableAddButton)
                if let response = viewModel.productResponse {
                    VStack {
                        Text("Product Added!")
                        Text(response.product.name)
                    }
                }
            }
        }
        .sheet(isPresented: $showPhotoPicker) {
            ImagePicker(images: $viewModel.images)
        }
    }
}

#Preview {
    AddProductView()
}
