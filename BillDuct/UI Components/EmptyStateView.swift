//
//  EmptyStateView.swift
//  BillDuct
//
//  Created by Raj Raval on 04/04/24.
//

import SwiftUI

enum EmptyStateConfiguration {
    case add
    case emptySearch
    case error(error: APIError)

    var title: String {
        switch self {
        case .emptySearch:
            return "No Results Found"
        case .error(let error):
            return error.title
        case .add:
            return "It's Empty"
        }
    }

    var subtitle: String {
        switch self {
        case .emptySearch:
            return "Try again"
        case .error(let error):
            return error.description
        case .add:
            return "Time to add one."
        }
    }

    var systemName: String {
        switch self {
        case .emptySearch:
            return "magnifyingglass"
        case .error(let error):
            return error.image
        case .add:
            return "cart.fill"
        }
    }

    var action: Bool {
        switch self {
        case .error(_), .add:
            return true
        case .emptySearch:
            return false
        }
    }

    var actionTitle: String {
        switch self {
        case .add:
            return "Add"
        case .error(_):
            return "Refresh"
        default:
            return ""
        }
    }

    var actionImage: String {
        switch self {
        case .add:
            return "plus"
        case .error(_):
            return "arrow.clockwise.circle.fill"
        default:
            return ""
        }
    }
}

struct EmptyStateView: View {

    var configuration: EmptyStateConfiguration?
    var systemName: String?
    var title: String?
    var subtitle: String?
    var customView: (() -> AnyView)?
    var refreshAction: (() -> Void)?

    init(configuration: EmptyStateConfiguration, refreshAction: (() -> Void)? = nil) {
        self.configuration = configuration
        self.refreshAction = refreshAction
    }

    init(
        systemName: String? = nil,
        title: String,
        subtitle: String? = nil,
        customView: (() -> AnyView)?
    )
    {
        self.systemName = systemName
        self.title = title
        self.subtitle = subtitle
        self.customView = customView
    }

    private var image: String {
        configuration?.systemName ?? systemName ?? ""
    }

    private var _title: String {
        configuration?.title ?? title ?? ""
    }

    private var _subtitle: String? {
        configuration?.subtitle ?? subtitle
    }

    private var actionTitle: String {
        configuration?.actionTitle ?? ""
    }

    private var actionImage: String {
        configuration?.actionImage ?? ""
    }

    var body: some View {
        BDVStack(spacing: .regularOne) {
            Image(systemName: image)
                .font(.h2)
                .foregroundStyle(.swipePrimary)
            BDVStack(spacing: .mini) {
                Text(_title)
                    .font(.p)
                if let _subtitle {
                    Text(_subtitle)
                        .font(.pSmall())
                        .foregroundStyle(.secondary)
                        .customPadding(.horizontal, spacing: .medium)
                }
            }
            .customPadding(.bottom, spacing: .small)
            if let refreshAction {
                BDButton(title: actionTitle, systemName: actionImage) {
                    refreshAction()
                }
                .chipButtonStyle(.primary)
            } else {
                AnyView(customView?())
            }
        }
        .multilineTextAlignment(.center)
    }
}

#Preview {
    EmptyStateView(configuration: .add)
}
