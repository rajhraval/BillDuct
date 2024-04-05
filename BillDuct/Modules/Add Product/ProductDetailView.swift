//
//  ProductDetailView.swift
//  BillDuct
//
//  Created by Raj Raval on 05/04/24.
//

import SwiftUI

struct ProductDetailView: View {

    let response: ProductResponse

    var body: some View {
        let product = response.product
        BDVStack(spacing: .small) {
            TitleSubtitleView(title: "Name", subTitle: product.name)
            TitleSubtitleView(title: "Type", subTitle: product.type)
            TitleSubtitleView(title: "Selling Price", subTitle: "INR \(product.price.toString)")
            TitleSubtitleView(title: "Tax Rate", subTitle: "\(product.tax.toString) %")
        }
    }
}

#Preview {
    ProductDetailView(response: .mockResponse)
}
