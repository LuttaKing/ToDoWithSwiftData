//
//  ToDoWithSwiftDataApp.swift
//  ToDoWithSwiftData
//
//  Created by Denilson Washuma on 24/06/2024.
//

import SwiftUI
import SwiftData

@main
struct ToDoWithSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ToDo.self)
    }
}
