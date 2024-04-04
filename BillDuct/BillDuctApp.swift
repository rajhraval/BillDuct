//
//  BillDuctApp.swift
//  BillDuct
//
//  Created by Raj Raval on 28/01/24.
//

import SwiftUI

@main
struct BillDuctApp: App {

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, CoreDataStack.shared.viewContext)
        }
    }
}
