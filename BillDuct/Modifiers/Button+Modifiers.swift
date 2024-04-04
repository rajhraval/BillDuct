//
//  Button+Modifiers.swift
//  BillDuct
//
//  Created by Raj Raval on 03/04/24.
//

import SwiftUI

struct RegularButtonStyle: ViewModifier {

    let style: BDButtonStyle

    func body(content: Content) -> some View {
        content
            .padding(.vertical, 14)
            .foregroundStyle(style.textColor)
            .background(style.backgroundColor)
            .clipShape(.rect(cornerRadius: 13))
    }
}

struct ChipButtonStyle: ViewModifier {

    let style: BDButtonStyle

    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(style.backgroundColor)
            .buttonBorderShape(.capsule)
    }
}


struct SymbolButtonStyle: ViewModifier {

    let style: BDButtonStyle

    func body(content: Content) -> some View {
        content
            .font(.symbol)
            .foregroundStyle(style.backgroundColor)
    }
}

struct TextSymbolButtonStyle: ViewModifier {

    let style: BDButtonStyle

    func body(content: Content) -> some View {
        content
            .font(.pTiny)
            .foregroundStyle(style.backgroundColor)
    }
}
