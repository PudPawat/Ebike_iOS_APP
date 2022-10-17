//
//  Ebike_settingApp.swift
//  Ebike_setting
//
//  Created by user on 2022/10/13.
//

import SwiftUI

@main
struct Ebike_settingApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
