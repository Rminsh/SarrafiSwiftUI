//
//  SarrafiApp.swift
//  Shared
//
//  Created by armin on 6/16/21.
//

import SwiftUI

@main
struct SarrafiApp: App {
    
    init(){
        #if os(iOS)
        Theme.setTheme(
            fontNormal: "Shabnam",
            fontInLine: "Shabnam-Medium",
            fontLarge: "Shabnam-Bold",
            background: UIColor(named: "BackgroundColor")
        )
        #endif
    }
    
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
