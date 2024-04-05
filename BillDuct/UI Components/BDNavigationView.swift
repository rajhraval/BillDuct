//
//  BDNavigationView.swift
//  BillDuct
//
//  Created by Raj Raval on 03/04/24.
//

import SwiftUI

enum BackButtonAction {
    case back
    case dismiss
    case none

    var image: String {
        switch self {
        case .back:
            return "chevron.left"
        case .dismiss:
            return "xmark"
        default:
            return ""
        }
    }
}

enum RightButtonAction {
    case add
    case favorite
    case none

    var image: String {
        switch self {
        case .add:
            return "plus.app.fill"
        case .favorite:
            return "heart.fill"
        default:
            return ""
        }
    }
}

struct BDNavigationView: View {

    @Environment(\.dismiss) private var dismiss
    var title: String
    var backButtonRole: BackButtonAction
    var rightButtonRole: RightButtonAction
    var rightButtonAction: (() -> Void)?

    init(title: String, backButtonRole: BackButtonAction = .none, rightButtonRole: RightButtonAction = .none, rightButtonAction: (() -> Void)? = nil) {
        self.title = title
        self.backButtonRole = backButtonRole
        self.rightButtonRole = rightButtonRole
        self.rightButtonAction = rightButtonAction
    }

    var body: some View {
        BDVStack(alignment: .leading, spacing: .regularTwo) {
            Spacer()
            if backButtonRole != .none {
                BDButton(systemName: backButtonRole.image) {
                    dismiss()
                }
                .symbolButtonStyle(.primary)
            }
            BDHStack {
                BDVStack(alignment: .leading) {
                    Text(title)
                        .font(.h2)
                }
                Spacer()
                if rightButtonRole != .none {
                    BDButton(systemName: rightButtonRole.image) {
                        rightButtonAction?()
                    }
                    .symbolButtonStyle(.primary)
                }
            }
        }
        .customPadding(.horizontal, spacing: .medium)
        .frame(minHeight: 72, maxHeight: 96)
    }
}

#Preview {
    VStack {
        BDNavigationView(title: "Products")
        Spacer()
    }
}
