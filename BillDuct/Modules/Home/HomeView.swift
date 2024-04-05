//
//  HomeView.swift
//  BillDuct
//
//  Created by Raj Raval on 28/01/24.
//

import SwiftUI

struct HomeView: View {

    @StateObject private var viewModel = HomeViewModel()
    @State private var showAddView = false

    var body: some View {
        NavigationStack {
            BDVStack(spacing: .regularThree) {
                BDNavigationView(title: "Products", rightButtonRole: .add) {
                    showAddView.toggle()
                }
                BDVStack(spacing: .regularThree) {
                    BDTextField(placeholder: "Search Products", text: $viewModel.searchText, isSearchEnabled: true)
                    GeometryReader { geo in
                        Group {
                            switch viewModel.loadingState {
                            case .idle:
                                if !viewModel.filteredProducts.isEmpty {
                                    ScrollView {
                                        BDVStack(spacing: .regularThree) {
                                            ForEach(viewModel.filteredProducts) { product in
                                                HomeRowView(product: product)
                                            }
                                        }
                                    }
                                    .scrollIndicators(.hidden)
                                } else {
                                    EmptyStateView(configuration: .emptySearch)
                                }
                            case .loading:
                                ProgressView()
                            case .error(let type):
                                EmptyStateView(configuration: .error(error: type)) {
                                    viewModel.fetchProducts()
                                }
                            }
                        }
                        .frame(width: geo.size.width, height: geo.size.height)
                    }
                }
                .customPadding(.horizontal, spacing: .medium)
                Spacer()
            }
            .ignoresSafeArea(.container, edges: .bottom)
        }
        .onAppear {
            viewModel.fetchProducts()
        }
        .sheet(isPresented: $showAddView) {
            AddProductView()
        }
    }
}

#Preview {
    HomeView()
}

/*

TODO:  CACHING IMAGE AND API RESPONSE FOR 2 MINUTES, 1:1 Image Resolution

GeometryReader { geo in
    ZStack(alignment: .bottom) {
        Group {
            BDButton("Show Alert") {
                withAnimation {
                    showAlert.toggle()
                }
            }
        }
        .frame(width: geo.size.width, height: geo.size.height)
        if showAlert {
            BDCustomAlertSheet(systemName: "checkmark.circle.fill", title: "Product Added") {
                Text("Hello")
            } dismissAction: {
                showAlert.toggle()
            }
            .background(.pink)
            .roundedCorners(24)
            .customPadding(.horizontal, spacing: .medium)
        }
    }
    .frame(width: geo.size.width, height: geo.size.height)
    .background(.orange)
}
*/

//if viewModel.products.isEmpty {
//    ProgressView()
//        .toolbar {
//            ToolbarItem(placement: .primaryAction) {
//                Button("Add") {
//                    showAddView.toggle()
//                }
//            }
//        }
//} else {
//    if viewModel.filteredProducts.isEmpty {
//        Text("No results found!")
//            .toolbar {
//                ToolbarItem(placement: .primaryAction) {
//                    Button("Add") {
//                        showAddView.toggle()
//                    }
//                }
//            }
//    } else {
//        List {
//            ForEach(viewModel.filteredProducts) { product in
//                AnyView(product.productImage)
//                Text(product.name)
//            }
//        }
//        .toolbar {
//            ToolbarItem(placement: .primaryAction) {
//                Button("Add") {
//                    showAddView.toggle()
//                }
//            }
//        }
//    }
//}
