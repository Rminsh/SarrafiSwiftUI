//
//  MainView.swift
//  Shared
//
//  Created by armin on 12/21/21.
//

import SwiftUI

struct MainView: View {
    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    #endif
    
    var body: some View {
        #if os(iOS)
        if horizontalSizeClass == .compact {
            TabNavigation()
        } else {
            Sidebar()
        }
        #else
        Sidebar()
        #endif
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
