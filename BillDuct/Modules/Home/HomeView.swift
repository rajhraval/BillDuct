//
//  HomeView.swift
//  BillDuct
//
//  Created by Raj Raval on 28/01/24.
//

import SwiftUI

struct HomeView: View {

    @EnvironmentObject private var networkManager: NetworkManager
    @StateObject private var viewModel = HomeViewModel()
    @State private var showAddView = false

    var body: some View {
        NavigationStack {
            if networkManager.isConnected {
                if viewModel.products.isEmpty {
                    ProgressView()
                        .toolbar {
                            ToolbarItem(placement: .primaryAction) {
                                Button("Add") {
                                    showAddView.toggle()
                                }
                            }
                        }
                } else {
                    if viewModel.filteredProducts.isEmpty {
                        Text("No results found!")
                            .toolbar {
                                ToolbarItem(placement: .primaryAction) {
                                    Button("Add") {
                                        showAddView.toggle()
                                    }
                                }
                            }
                    } else {
                        List {
                            ForEach(viewModel.filteredProducts) { product in
                                Text(product.name)
                            }
                        }
                        .toolbar {
                            ToolbarItem(placement: .primaryAction) {
                                Button("Add") {
                                    showAddView.toggle()
                                }
                            }
                        }
                    }
                }
            } else {
                Text("No Internet")
            }
        }
        .searchable(text: $viewModel.searchText, prompt: Text("Search"))
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
        .environmentObject(NetworkManager())
}

/*

TODO:  CACHING IMAGE AND API RESPONSE FOR 2 MINUTES, 1:1 Image Resolution, Reachability

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
