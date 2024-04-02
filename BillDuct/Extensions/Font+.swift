//
//  Font+.swift
//  BillDuct
//
//  Created by Raj Raval on 02/04/24.
//

import SwiftUI

extension Font {

    private static func customFont(with name: FontName = .plusJakartaSans, weight: FontWeight, size: FontSize) -> Font {
        return .custom("\(name.name)\(weight.name)", size: size.rawValue)
    }

    /// Extrabold, 56
    static var h0 = customFont(weight: .extraBold, size: .h0)
    /// Bold, 36
    static var h1 = customFont(weight: .bold, size: .h1)
    /// Extrabold, 34
    static var h2 = customFont(weight: .extraBold, size: .h2)
    /// Bold, 22
    static var h3 = customFont(weight: .bold, size: .h3)
    /// Extrabold, 20
    static var pLarge = customFont(weight: .extraBold, size: .pLarge)
    /// Bold, 18
    static var p = customFont(weight: .bold, size: .p)
    /// Bold, 16
    static func pSmall(isBold: Bool = false) -> Font { customFont(weight: isBold ? .bold : .semiBold, size: .pSmall) }
    /// Bold, 12
    static var pTiny = customFont(weight: .bold, size: .pSmall)
    /// Heavy, 18
    static var symbol: Font = .system(size: 18, weight: .heavy)

}

