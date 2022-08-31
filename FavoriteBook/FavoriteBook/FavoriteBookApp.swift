//
//  FavoriteBookApp.swift
//  FavoriteBook
//
//  Created by Mehmet Ali Kılıçlı on 26.08.2022.
//

import SwiftUI

@main
struct FavoriteBookApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
