//
//  NetworkManager.swift
//  BillDuct
//
//  Created by Raj Raval on 04/04/24.
//

import Foundation
import Network

final class NetworkManager: ObservableObject {

    private let networkMonitor = NWPathMonitor()
    private let workerQueue = DispatchQueue(label: "Monitor")
    @Published var isConnected = false

    init() {
        networkMonitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
            Task {
                await MainActor.run {
                    self.objectWillChange.send()
                }
            }
        }
        networkMonitor.start(queue: workerQueue)
    }

}
