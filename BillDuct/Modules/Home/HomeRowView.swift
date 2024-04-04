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
                BDHStack {
                    Text("Type")
                        .font(.pTwo)
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text(product.type).font(.pTwo)
                }
                BDHStack {
                    Text("Selling Price")
                        .font(.pTwo)
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text("INR \(product.price.toString)").font(.pTwo)
                }
                BDHStack {
                    Text("Tax Rate")
                        .font(.pTwo)
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text("\(product.tax.toString) %").font(.pTwo)
                }
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
