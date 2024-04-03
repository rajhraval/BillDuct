//
//  BDTextField.swift
//  BillDuct
//
//  Created by Raj Raval on 03/04/24.
//

import SwiftUI

struct BDTextField: View {

    let placeholder: String
    @Binding var text: String
    var isSearchEnabled: Bool

    init(placeholder: String, text: Binding<String>, isSearchEnabled: Bool = false) {
        self.placeholder = placeholder
        self._text = text
        self.isSearchEnabled = isSearchEnabled
    }

    var body: some View {
        ZStack(alignment: .trailing) {
            TextField(placeholder, text: $text)
                .font(.pSmall())
                .customPadding(spacing: .regularTwo)
                .background(Color(UIColor.secondarySystemBackground))
                .defaultCornerRadius()
            if isSearchEnabled && !text.isEmpty {
                BDButton(systemName: "xmark.circle.fill") {
                    withAnimation(.linear) {
                        text = ""
                    }
                }
                .symbolButtonStyle(.primary)
                .padding(.trailing)
            }
        }
    }
}

#Preview {
    BDTextField(placeholder: "Enter name here", text: .constant("Hello"), isSearchEnabled: true)
        .padding(.horizontal)
}
