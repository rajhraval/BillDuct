//
//  BDErrorAlertSheet.swift
//  BillDuct
//
//  Created by Raj Raval on 05/04/24.
//

import SwiftUI

struct BDErrorAlertSheet: View {

    let error: APIError
    var dismissAction: () -> Void

    var body: some View {
        BDVStack(spacing: .medium) {
            BDVStack(spacing: .small) {
                Image(systemName: error.image)
                    .font(.h0)
                    .foregroundStyle(.swipePrimary)
                BDVStack {
                    Text(error.title)
                        .font(.h3)
                    Text(error.description)
                        .font(.pSmall())
                        .foregroundStyle(.secondary)
                }
            }
            BDButton("Dismiss") {
                withAnimation {
                    dismissAction()
                }
            }
            .regularButtonStyle(.primary)
            .customPadding(.horizontal, spacing: .medium)
        }
        .customPadding(spacing: .medium)
        .transition(.move(edge: .bottom))
    }
}

#Preview {
    BDErrorAlertSheet(error: .internetError) {

    }
}
