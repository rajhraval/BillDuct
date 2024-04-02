//
//  Data+.swift
//  BillDuct
//
//  Created by Raj Raval on 02/04/24.
//

import Foundation

extension Data {
    mutating func append(
        _ string: String,
        encoding: String.Encoding = .utf8
    ) {
        guard let data = string.data(using: encoding) else {
            return
        }
        append(data)
    }
}
