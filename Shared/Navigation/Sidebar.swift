//
//  Sidebar.swift
//  Shared
//
//  Created by armin on 12/21/21.
//

import SwiftUI

struct Sidebar: View {

    @StateObject var viewModel = NavigationItemsModel()
    
    init() {
        #if os(iOS)
        UITableView.appearance().backgroundColor = .clear
        #endif
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.navigationItems) { item in
                    NavigationLink(
                        tag: item.id,
                        selection: $viewModel.selectedId
                    ) {
                        item.content
                            .navigationTitle(item.name)
                    } label: {
                        Label(item.name, systemImage: item.icon)
                            .customFont(name: "Shabnam", style: .body)
                    }
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("APP_NAME")
            #if os(iOS)
            .background(Color("BackgroundColor"))
            #endif
            .toolbar {
                #if os(macOS)
                ToolbarItemGroup {
                    Button(action: toggleSidebar) {
                        Image(systemName: "sidebar.leading")
                            .help("Toggle Sidebar")
                    }
                }
                #endif
            }
            .frame(minWidth: 150)
            Text("No selection")
        }
    }
    
    #if os(macOS)
    func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
    #endif
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
    }
}
