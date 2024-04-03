//
//  BDButton.swift
//  BillDuct
//
//  Created by Raj Raval on 03/04/24.
//

import SwiftUI

enum BDButtonStyle {
    case primary
    case secondary
    case destructive
    case custom(color: Color)

    var textColor: Color {
        switch self {
        case .primary, .destructive:
            return .white
        case .secondary:
            return .swipePrimary
        case .custom(let color):
            return color
        }
    }

    var backgroundColor: Color {
        switch self {
        case .primary:
            return .swipePrimary
        case .secondary:
            return .swipeSecondary
        case .destructive:
            return .red
        case .custom(let color):
            return color
        }
    }
}

struct BDButton<Label: View>: View {

    public var label: () -> Label
    public var action: () -> Void

    public init(
        _ title: String,
        action: @escaping () -> Void
    ) where Label == Text {
        self.label = { Text(title) }
        self.action = action
    }

    public init(
        systemName: String,
        action: @escaping () -> Void
    ) where Label == Image {
        self.label = { Image(systemName: systemName) }
        self.action = action
    }

    public init(
        title: String,
        systemName: String,
        action: @escaping () -> Void
    ) where Label == AnyView {
        self.label = {
            AnyView(
                HStack(spacing: 4) {
                    Text(title)
                    Image(systemName: systemName)
                }
            )
        }
        self.action = action
    }


    var body: some View {
        Button {
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
            action()
        } label: {
            if Label.self == Image.self {
                label()
                    .font(.symbol)
            } else {
                label()
                    .frame(maxWidth: .infinity)
                    .font(.p)
            }
        }
    }
}

#Preview {
    BDButton(systemName: "plus") {
        
    }
    .symbolButtonStyle(.destructive)
    .padding(.horizontal)
}
