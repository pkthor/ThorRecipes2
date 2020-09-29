//
//  ThorRecipes2App.swift
//  ThorRecipes2
//
//  Created by P. Kurt Thorderson on 9/29/20.
//

import SwiftUI

@main
struct ThorRecipes2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
