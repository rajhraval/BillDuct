//
//  Double+.swift
//  BillDuct
//
//  Created by Raj Raval on 02/04/24.
//

import Foundation

extension Double {

    /// Returns upto two decimals
    var toString: String {
        return String(format: "%.2f", self)
    }

}
