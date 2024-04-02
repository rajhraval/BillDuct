//
//  Publisher+.swift
//  BillDuct
//
//  Created by Raj Raval on 02/04/24.
//

import Combine
import Foundation

extension Publisher where Output == String, Failure == Never {
    var isEmpty: AnyPublisher<Bool, Never> {
        map { $0.isEmpty }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
