//
//  BDCustomAlertSheet.swift
//  BillDuct
//
//  Created by Raj Raval on 03/04/24.
//

import SwiftUI

struct BDCustomAlertSheet<Label: View>: View {

    var style: BDButtonStyle
    let systemName: String
    let title: String
    var label: () -> Label
    var dismissAction: () -> Void

    init(
        style: BDButtonStyle = .primary,
        systemName: String,
        title: String,
        @ViewBuilder label: @escaping () -> Label,
        dismissAction: @escaping () -> Void
    ) {
        self.style = style
        self.systemName = systemName
        self.title = title
        self.label = label
        self.dismissAction = dismissAction
    }

    var body: some View {
        BDVStack {
            BDVStack(spacing: .small) {
                Image(systemName: systemName)
                    .font(.h0)
                    .foregroundStyle(style.backgroundColor)
                Text(title)
                    .font(.h3)
            }
            label()
                .customPadding(spacing: .extraLarge)
            BDButton("Dismiss") {
                withAnimation {
                    dismissAction()
                }
            }
            .regularButtonStyle(style)
            .customPadding(.horizontal, spacing: .medium)
        }
        .customPadding(spacing: .medium)
        .transition(.move(edge: .bottom))
    }
}

#Preview {
    BDCustomAlertSheet(systemName: "checkmark.circle.fill", title: "Product Added") {
        Spacer().frame(height: 1)
    } dismissAction: {

    }
    .background(.orange)
}
