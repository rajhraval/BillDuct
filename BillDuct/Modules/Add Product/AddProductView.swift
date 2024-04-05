//
//  AddProductView.swift
//  BillDuct
//
//  Created by Raj Raval on 02/04/24.
//

import SwiftUI

struct AddProductView: View {

    @Environment(\.dismiss) private var dismiss

    @StateObject private var viewModel = AddProductViewModel()

    @State private var showPhotoPicker = false

    private var imagesStackView: some View {
        ForEach(viewModel.images, id: \.self) { image in
            HStack {
                ZStack(alignment: .topTrailing) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .size(.extraLarge)
                        .defaultCornerRadius()
                    BDButton(systemName: "xmark.circle.fill") {
                        withAnimation {
                            viewModel.removeImage(image)
                        }
                    }
                    .symbolTextButtonStyle(.primary)
                    .customPadding([.top, .trailing], spacing: .custom(value: -4))
                }
                Spacer()
            }
        }
    }

    var body: some View {
        NavigationStack {
            BDVStack(spacing: .medium) {
                BDNavigationView(title: "Add Product", backButtonRole: .dismiss)
                GeometryReader { geo in
                    ZStack(alignment: .bottom) {
                        ScrollView {
                            BDVStack(spacing: .regularThree) {
                                BDSection(title: "Name") {
                                    BDTextField(placeholder: "Enter product name", text: $viewModel.name)
                                }
                                BDSection(title: "Type") {
                                    BDTextField(placeholder: "Enter product type", text: $viewModel.type)
                                }
                                BDSection(title: "Selling Price") {
                                    BDTextField(placeholder: "Enter product price", text: $viewModel.price)
                                }
                                BDSection(title: "Tax Rate") {
                                    BDTextField(placeholder: "Enter product tax rate", text: $viewModel.tax)
                                }
                                if viewModel.images.isEmpty {
                                    Spacer()
                                } else {
                                    imagesStackView
                                }
                                BDButton("Upload Images") {
                                    showPhotoPicker.toggle()
                                }
                                .regularButtonStyle(.secondary)
                                BDButton("Add") {
                                    viewModel.addProduct()
                                }
                                .regularButtonStyle(.primary)
                            }
                            .frame(height: geo.size.height)
                        }
                        .scrollIndicators(.hidden)
                        if let response = viewModel.productResponse {
                            BDCustomAlertSheet(systemName: "checkmark.circle.fill", title: "Product Added") {
                                ProductDetailView(response: response)
                            } dismissAction: {
                                dismiss()
                            }
                        }
                    }
                    .customPadding(.horizontal, spacing: .medium)
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
