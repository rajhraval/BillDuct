//
//  AddProductView.swift
//  BillDuct
//
//  Created by Raj Raval on 02/04/24.
//

import SwiftUI

struct AddProductView: View {

    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) private var colorScheme

    @StateObject private var viewModel = AddProductViewModel()

    @State private var showPhotoPicker = false
    @State private var y: CGFloat = 0

    private var imagesStackView: some View {
        HStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .size(.extraLarge)
                    .defaultCornerRadius()
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }

    private var transculentView: some View {
        let color: Color = colorScheme == .dark ? .white : .black
        return color.opacity(0.2).ignoresSafeArea().zIndex(2)
    }

    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ZStack(alignment: .bottom) {
                    if let _ = viewModel.productResponse {
                        transculentView
                    } else if viewModel.isLoading {
                        transculentView
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
                                        Menu {
                                            ForEach(viewModel.productOptions) { option in
                                                Button {
                                                    viewModel.type = option.display
                                                } label: {
                                                    Text(option.display)
                                                }
                                                .buttonStyle(.plain)
                                            }
                                        } label: {
                                            HStack {
                                                Text(viewModel.type)
                                                    .height(.medium)
                                                    .font(.pSmall())
                                                    .customPadding(.horizontal, spacing: .regularTwo)
                                                Spacer()
                                            }
                                            .frame(maxWidth: .infinity)
                                            .background(Color(UIColor.secondarySystemBackground))
                                            .defaultCornerRadius()
                                            .multilineTextAlignment(.leading)
                                        }
                                        .foregroundStyle(viewModel.isProductSelected ? .primary : .tertiary)
                                    }
                                    BDSection(title: "Selling Price") {
                                        BDTextField(placeholder: "Enter product price", text: $viewModel.price).keyboardType(.decimalPad)
                                    }
                                    BDSection(title: "Tax Rate") {
                                        BDTextField(placeholder: "Enter product tax rate", text: $viewModel.tax).keyboardType(.decimalPad)
                                    }
                                    if let _ = viewModel.image {
                                        BDSection(title: "Image") {
                                            imagesStackView
                                        }
                                    } else {
                                        Spacer()
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
                    showalertView(geo)
                }
                .onAppear {
                    withAnimation(.bouncy) {
                        y = geo.frame(in: .global).midY - geo.size.height / 2
                    }
                }
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
        .sheet(isPresented: $showPhotoPicker) {
            ImagePicker(image: $viewModel.image)
        }
    }

    func showalertView(_ geo: GeometryProxy) -> some View {
        return Group {
            switch viewModel.loadingState {
            case .loading:
                ProgressView()
                    .size(.extraLarge)
                    .alertSheet()
                    .position(x: Constants.Screen.halfScreenWidth, y: Constants.Screen.halfScreenHeight)
            case .error(let error):
                BDErrorAlertSheet(error: error) {
                    viewModel.loadingState = .idle
                    y = 0
                }
                .alertSheet()
                .offset(y: y)
                .transition(.move(edge: .top))
            default:
                EmptyView()
            }
            if let response = viewModel.productResponse {
                BDCustomAlertSheet(systemName: "checkmark.circle.fill", title: "Product Added") {
                    ProductDetailView(response: response)
                } dismissAction: {
                    viewModel.resetValues()
                }
                .alertSheet()
                .offset(y: y)
                .transition(.move(edge: .top))
            }
        }
    }
}

#Preview {
    AddProductView()
}
