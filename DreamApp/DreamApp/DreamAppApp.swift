//
//  Dream.swift
//  Dream
//
//  Created by Yahan Yang on 11/20/24.
//

import SwiftUI
import SwiftData

@main
struct DreamApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
            .modelContainer(for: DreamEntry.self)
    }
}
