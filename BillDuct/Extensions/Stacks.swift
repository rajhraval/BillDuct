//
//  Stacks.swift
//  BillDuct
//
//  Created by Raj Raval on 03/04/24.
//

import SwiftUI

public struct BDVStack<Content: View>: View {
    public var alignment: HorizontalAlignment
    public var spacing: Constants.Spacing?
    @ViewBuilder public var content: () -> Content

    public init(alignment: HorizontalAlignment = .center, spacing: Constants.Spacing? = nil, @ViewBuilder content: @escaping () -> Content = { EmptyView() as! Content }) {
        self.alignment = alignment
        self.spacing = spacing
        self.content = content
    }

    public var body: some View {
        VStack(alignment: alignment, spacing: spacing?.spacing, content: content)
    }
}

public struct BDHStack<Content: View>: View {

    public var alignment: VerticalAlignment
    public var spacing: Constants.Spacing?
    public var content: () -> Content

    public init(alignment: VerticalAlignment = .center, spacing: Constants.Spacing? = nil, @ViewBuilder content: @escaping () -> Content = { EmptyView() as! Content }) {
        self.alignment = alignment
        self.spacing = spacing
        self.content = content
    }

    public var body: some View {
        HStack(alignment: alignment, spacing: spacing?.spacing, content: content)
    }
}
