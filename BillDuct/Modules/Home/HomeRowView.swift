//
//  HomeRowView.swift
//  BillDuct
//
//  Created by Raj Raval on 04/04/24.
//

import SwiftUI

struct HomeRowView: View {

    let product: Product

    var body: some View {
        BDVStack(alignment: .leading, spacing: .regularTwo) {
            BDHStack(spacing: .regularThree) {
                AnyView(product.productImage)
                BDVStack(alignment: .leading, spacing: .zero) {
                    Text("Product Name")
                        .font(.pTwo)
                        .foregroundStyle(.secondary)
                    Text(product.name)
                        .font(.p)
                }
            }
            BDVStack(spacing: .small) {
                TitleSubtitleView(title: "Type", subTitle: product.type)
                TitleSubtitleView(title: "Selling Price", subTitle: "INR \(product.price.toString)")
                TitleSubtitleView(title: "Tax Rate", subTitle: "\(product.tax.toString) %")
            }
        }
        .customPadding(spacing: .regularThree)
        .background(Color(UIColor.secondarySystemBackground))
        .roundedCorners(17)
    }
}

#Preview {
    HomeRowView(product: .mockProduct).customPadding(.horizontal, spacing: .medium)
}
