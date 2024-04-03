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
}
