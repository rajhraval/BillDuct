//
//  TitleSubtitleView.swift
//  BillDuct
//
//  Created by Raj Raval on 05/04/24.
//

import SwiftUI

struct TitleSubtitleView: View {

    let title: String
    let subTitle: String

    var body: some View {
        BDHStack {
            Text(title)
                .font(.pTwo)
                .foregroundStyle(.secondary)
            Spacer()
            Text(subTitle).font(.pTwo)
        }
    }
}

#Preview {
    TitleSubtitleView(title: "Selling Price", subTitle: "INR 200").padding(.horizontal)
}
