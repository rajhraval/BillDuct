//
//  UIImage+.swift
//  BillDuct
//
//  Created by Raj Raval on 04/04/24.
//

import UIKit.UIImage

extension [UIImage] {

    func toJPEGData(compressionQuality: CGFloat = 0.75) -> [Data] {
        return self.compactMap { $0.jpegData(compressionQuality: compressionQuality) }
    }

    var toPNGData: [Data] {
        return self.compactMap { $0.pngData() }
    }

}
