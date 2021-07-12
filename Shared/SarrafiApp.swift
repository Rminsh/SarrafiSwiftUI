//
//  SarrafiApp.swift
//  Shared
//
//  Created by armin on 6/16/21.
//

import SwiftUI

@main
struct SarrafiApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            SidebarCommands()
        }
        #if os(macOS)
        .windowToolbarStyle(.unifiedCompact)
        #endif
        
    }
}
