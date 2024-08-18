//
//  CatMateApp.swift
//  CatMate
//
//  Created by José Miguel Lapa on 18/08/2024.
//

import SwiftUI

@main
struct CatMateApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
