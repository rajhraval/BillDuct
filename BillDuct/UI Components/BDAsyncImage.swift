//
//  BDAsyncImage.swift
//  BillDuct
//
//  Created by Raj Raval on 06/04/24.
//

import SwiftUI

struct BDAsyncImage: View {

    @ObservedObject private var imageLoader: ImageLoader

    init(url: String) {
        self.imageLoader = ImageLoader(url: url)
    }

    var body: some View {
        if let image = imageLoader.image {
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
        } else {
            ProgressView()
        }
    }
}

#Preview {
    BDAsyncImage(url: "")
}
