//
//  BillDuctApp.swift
//  BillDuct
//
//  Created by Raj Raval on 28/01/24.
//

import SwiftUI

@main
struct BillDuctApp: App {

    @StateObject private var networkManager = NetworkManager()

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, CoreDataStack.shared.viewContext)
                .environmentObject(networkManager)
        }
    }
}
