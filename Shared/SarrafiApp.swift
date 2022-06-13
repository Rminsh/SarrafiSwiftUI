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
            MainView()
        }
        .commands {
            SidebarCommands()
        }
        #if os(macOS)
        .windowToolbarStyle(.unified)
        #endif
    }
}
