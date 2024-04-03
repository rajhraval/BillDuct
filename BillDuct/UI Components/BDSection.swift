//
//  BDSection.swift
//  BillDuct
//
//  Created by Raj Raval on 03/04/24.
//

import SwiftUI

struct BDSection<Label: View>: View {

    let title: String
    let label: () -> Label

    init(title: String, @ViewBuilder label:  @escaping () -> Label) {
        self.title = title
        self.label = label
    }

    var body: some View {
        BDVStack(alignment: .leading) {
            Text(title)
                .font(.pSmall())
                .foregroundStyle(.secondary)
            label()
        }
    }
}

#Preview {
    BDSection(title: "Name") {
        BDTextField(placeholder: "Enter name here", text: .constant("Hello"))
    }
    .padding(.horizontal)
}
