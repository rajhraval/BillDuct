//
//  View+.swift
//  BillDuct
//
//  Created by Raj Raval on 03/04/24.
//

import SwiftUI

extension View {

    // MARK: Padding

    func customPadding(_ edges: Edge.Set = .all, spacing: Constants.Spacing) -> some View {
        modifier(PaddingModifier(edgeInsets: edges, spacing: spacing))
    }

    // MARK: Corner Radius

    func roundedCorners(_ radius: CGFloat) -> some View {
        modifier(RoundedCornerRadius(radius: radius))
    }

    func defaultCornerRadius() -> some View {
        modifier(DefaultCornerRadius())
    }

    // MARK: Spacing and Sizings

    func size(_ size: Constants.Size) -> some View {
        modifier(SizeModifier(size: size))
    }

    func height(_ size: Constants.Size) -> some View {
        modifier(HeightModifier(size: size))
    }

    func width(_ size: Constants.Size) -> some View {
        modifier(WidthModifier(size: size))
    }

    func heightSpacing(spacing: Constants.Spacing) -> some View {
        modifier(HeightSpacingModifier(spacing: spacing))
    }

    func widthSpacing(spacing: Constants.Spacing) -> some View {
        modifier(WidthSpacingModifier(spacing: spacing))
    }

    // MARK: Button

    func regularButtonStyle(_ style: BDButtonStyle) -> some View {
        modifier(RegularButtonStyle(style: style))
    }

    func symbolButtonStyle(_ style: BDButtonStyle) -> some View {
        modifier(SymbolButtonStyle(style: style))
    }

    func symbolTextButtonStyle(_ style: BDButtonStyle) -> some View {
        modifier(TextSymbolButtonStyle(style: style))
    }

    func chipButtonStyle(_ style: BDButtonStyle) -> some View {
        modifier(ChipButtonStyle(style: style))
    }


}
