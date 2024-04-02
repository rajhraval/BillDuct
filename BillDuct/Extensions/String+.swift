//
//  String+.swift
//  BillDuct
//
//  Created by Raj Raval on 02/04/24.
//

import Foundation

extension String {

    /// Converts the string (if number) upto two decimals
    var toDouble: Double {
        Double(self) ?? 0.00
    }

}
