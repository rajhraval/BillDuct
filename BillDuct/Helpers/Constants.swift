//
//  Constants.swift
//  TemplateUIKit
//
//  Created by Raj Raval on 28/01/24.
//

import SwiftUI

public struct Constants {

    static var appGroup: String {
        #if BETA
            return "group.com.rajraval.BillDuct-Beta"
        #else
            return "group.com.rajraval.BillDuct"
        #endif
    }

    public static let defaultCornerRadius: CGFloat = 13

    public enum Spacing {
        case zero
        /// Mini, 4
        case mini
        /// Small, 8
        case small
        /// Regular, 12
        case regularOne
        /// Regular, 14
        case regularTwo
        /// Regular, 16
        case regularThree
        /// Medium, 24
        case medium
        /// Large, 28
        case large
        /// Extra Large, 36
        case extraLarge
        /// Navigation, 72
        case navigation
        /// Custom
        case custom(value: CGFloat)

        public var spacing: CGFloat {
            switch self {
            case .mini:
                return 4
            case .small:
                return 8
            case .medium:
                return 24
            case .large:
                return 28
            case .extraLarge:
                return 36
            case .regularOne:
                return 12
            case .regularTwo:
                return 14
            case .regularThree:
                return 16
            case .zero:
                return 0
            case .custom(let value):
                return value
            case .navigation:
                return 72
            }
        }
    }

    public enum Screen {
        public static let screenHeight: CGFloat = UIScreen.current?.bounds.height ?? UIScreen.main.bounds.height
        public static let screenWidth: CGFloat = UIScreen.current?.bounds.width ?? UIScreen.main.bounds.width
        public static let halfScreenHeight: CGFloat = screenHeight / 2
        public static let halfScreenWidth: CGFloat = screenWidth / 2
    }

    public enum Size {
        /// Mini, 24
        case mini
        /// Small, 28
        case small
        /// Regular, 36
        case regular
        /// Medium, 48
        case medium
        /// Large, 56
        case large
        /// Extra Large, 64
        case extraLarge
        /// Super Large, 72
        case superLarge
        /// Custom
        case custom(width: CGFloat, height: CGFloat)

        public var size: CGSize {
            switch self {
            case .mini:
                return CGSize(width: 24, height: 24)
            case .small:
                return CGSize(width: 28, height: 28)
            case .regular:
                return CGSize(width: 36, height: 36)
            case .medium:
                return CGSize(width: 48, height: 48)
            case .large:
                return CGSize(width: 56, height: 56)
            case .extraLarge:
                return CGSize(width: 64, height: 64)
            case .superLarge:
                return CGSize(width: 72, height: 72)
            case .custom(let width, let height):
                return CGSize(width: width, height: height)
            }
        }
    }

}
