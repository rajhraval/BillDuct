//
//  HomeView.swift
//  BillDuct
//
//  Created by Raj Raval on 28/01/24.
//

import SwiftUI

struct HomeView: View {

    @ObservedObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationStack {
            if viewModel.products.isEmpty {
                ProgressView()
            } else {
                List {
                    ForEach(viewModel.products) { product in
                        Text(product.name)
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchProducts()
        }
    }
}

#Preview {
    HomeView()
}
