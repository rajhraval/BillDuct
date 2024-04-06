//
//  ImageLoader.swift
//  BillDuct
//
//  Created by Raj Raval on 06/04/24.
//

import Foundation
import SwiftUI

final class ImageLoader: ObservableObject, API {

    @Published var image: UIImage?

    private let url: String
    private let cacher: ImageCacher!

    init(url: String, cacher: ImageCacher = ImageCacher()) {
        self.url = url
        self.cacher = cacher
        loadImage()
    }

    private func loadImage() {
        if let cachedImage = cacher.get(forKey: url) {
            image = cachedImage
            return
        }

        guard let url = URL(string: url) else { return }
        Task { @MainActor in
            do {
                image = try await requestImage(from: url)
                if let image {
                    cacher.set(image, forKey: self.url)
                }
            } catch let error {
                Log.error(error)
            }
        }
    }

}
