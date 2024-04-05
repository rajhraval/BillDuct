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
            ZStack(alignment: .bottom) {
                if let _ = viewModel.productResponse {
                    Color.white.opacity(0.2).ignoresSafeArea()
                }
                BDVStack(spacing: .regularOne) {
                    BDHStack {
                        BDButton(systemName: "xmark") {
                            dismiss()
                        }
                        .symbolButtonStyle(.primary)
                        Spacer()
                    }
                    .customPadding(.top, spacing: .medium)
                    ScrollView {
                        BDVStack(spacing: .regularThree) {
                            BDNavigationView(title: "Add Product")
                                .customPadding([.horizontal, .top], spacing: .custom(value: -24))
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
                                    BDSection(title: "Images") {
                                        imagesStackView
                                    }
                                }
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    .disabled(viewModel.productResponse == nil ? false : true)
                    BDButton("Upload Images") {
                        showPhotoPicker.toggle()
                    }
                    .regularButtonStyle(.secondary)
                    BDButton("Add") {
                        viewModel.addProduct()
                    }
                    .regularButtonStyle(viewModel.disableAddButton ? .disabled : .primary)
                    .disabled(viewModel.disableAddButton)
                    Spacer()
                }
                .customPadding(.horizontal, spacing: .medium)
                if let response = viewModel.productResponse {
                    BDCustomAlertSheet(systemName: "checkmark.circle.fill", title: "Product Added") {
                        ProductDetailView(response: response)
                    } dismissAction: {
                        viewModel.resetValues()
                    }
                    .background(.background)
                    .roundedCorners(27)
                    .customPadding(spacing: .regularThree)
                    .shadow(color: .white.opacity(0.1), radius: 10, y: -4)
                    .zIndex(2)
                }
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
        .sheet(isPresented: $showPhotoPicker) {
            ImagePicker(images: $viewModel.images)
        }
    }
}

#Preview {
    AddProductView()
}

//
//BDVStack(spacing: .medium) {
//    BDNavigationView(title: "Add Product", backButtonRole: .dismiss)
//    GeometryReader { geo in
//        ZStack(alignment: .bottom) {
//            ScrollView {

//                .frame(height: geo.size.height)
//            }
//            .scrollIndicators(.hidden)
//            Color.black.ignoresSafeArea()
//                .frame(height: -geo.size.height)
//                .padding(-24)

//        }
//        .customPadding(.horizontal, spacing: .medium)
//    }
//}
