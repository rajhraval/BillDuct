//
//  Helper+Modifiers.swift
//  BillDuct
//
//  Created by Raj Raval on 03/04/24.
//

import SwiftUI

struct DefaultCornerRadius: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(.rect(cornerRadius: Constants.defaultCornerRadius))
    }
}

struct RoundedCornerRadius: ViewModifier {
    let radius: CGFloat

    func body(content: Content) -> some View {
        content
            .clipShape(.rect(cornerRadius: radius))
    }
}

struct PaddingModifier: ViewModifier {
    var edgeInsets: Edge.Set
    var spacing: Constants.Spacing

    func body(content: Content) -> some View {
        content
            .padding(edgeInsets, spacing.spacing)
    }
}

struct SizeModifier: ViewModifier {
    let size: Constants.Size

    func body(content: Content) -> some View {
        content
            .frame(width: size.size.width, height: size.size.height)
    }
}

struct HeightModifier: ViewModifier {
    let size: Constants.Size

    func body(content: Content) -> some View {
        content
            .frame(height: size.size.height)
    }
}

struct WidthModifier: ViewModifier {
    let size: Constants.Size

    func body(content: Content) -> some View {
        content
            .frame(width: size.size.width)
    }
}

struct HeightSpacingModifier: ViewModifier {
    let spacing: Constants.Spacing

    func body(content: Content) -> some View {
        content
            .frame(height: spacing.spacing)
    }
}

struct WidthSpacingModifier: ViewModifier {
    let spacing: Constants.Spacing

    func body(content: Content) -> some View {
        content
            .frame(width: spacing.spacing)
    }
}
