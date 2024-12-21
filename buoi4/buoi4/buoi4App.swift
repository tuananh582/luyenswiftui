//
//  buoi4App.swift
//  buoi4
//
//  Created by TuanAnh on 2/12/24.
//

import SwiftUI

@main
struct buoi4App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
