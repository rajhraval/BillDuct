//
//  ImageCacher.swift
//  BillDuct
//
//  Created by Raj Raval on 06/04/24.
//

import UIKit.UIImage

final class ImageCacher {
    private let cache = NSCache<NSString, UIImage>()

    func set(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }

    func get(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
}
