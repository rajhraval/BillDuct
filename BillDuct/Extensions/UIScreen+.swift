//
//  UIScreen+.swift
//  BillDuct
//
//  Created by Raj Raval on 03/04/24.
//

import SwiftUI

public extension UIScreen {
    static var current: UIScreen? {
        UIWindow.current?.screen
    }
}
