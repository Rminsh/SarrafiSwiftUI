/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The app's navigation with a configuration that offers a sidebar, content list, and detail pane.
*/

import SwiftUI

struct AppSidebarNavigation: View {

    @State private var selection: NavigationItem? = .cash
    
    var body: some View {
        NavigationView {
            List {
                // MARK: - Currencies price
                NavigationLink(tag: NavigationItem.cash, selection: $selection) {
                    SymbolListView(type: .cash)
                        .navigationTitle(Text(NavigationItem.cash.name, comment: NavigationItem.cash.comment))
                } label: {
                    Label(NavigationItem.cash.name, systemImage: NavigationItem.cash.icon)
                        .customFont(name: "Shabnam", style: .body)
                }
                
                // MARK: - Gold and coins price
                NavigationLink(tag: NavigationItem.gold, selection: $selection) {
                    SymbolListView(type: .gold)
                        .navigationTitle(Text(NavigationItem.gold.name, comment: NavigationItem.gold.comment))
                } label: {
                    Label(NavigationItem.gold.name, systemImage: NavigationItem.gold.icon)
                        .customFont(name: "Shabnam", style: .body)
                }
            
                // MARK: - Cryptocurrencies price
                NavigationLink(tag: NavigationItem.crypto, selection: $selection) {
                    SymbolListView(type: .crypto)
                        .navigationTitle(Text(NavigationItem.crypto.name, comment: NavigationItem.crypto.comment))
                } label: {
                    Label(NavigationItem.crypto.name, systemImage: NavigationItem.crypto.icon)
                        .customFont(name: "Shabnam", style: .body)
                }
                
                // MARK: - Oil and gas price
                NavigationLink(tag: NavigationItem.oil, selection: $selection) {
                    SymbolListView(type: .oil)
                        .navigationTitle(Text(NavigationItem.oil.name, comment: NavigationItem.oil.comment))
                } label: {
                    Label(NavigationItem.oil.name, systemImage: NavigationItem.oil.icon)
                        .customFont(name: "Shabnam", style: .body)
                }
            }
            .frame(minWidth: 200)
            .listStyle(SidebarListStyle())
            .toolbar(content: {
                #if os(macOS)
                ToolbarItemGroup {
                    Button(action: toggleSidebar) {
                        Image(systemName: "sidebar.left")
                            .help("Toggle Sidebar")
                    }
                }
                #endif
            })
            .navigationTitle("APP_NAME")
            
//            Text("Select a category")
//                .foregroundStyle(.secondary)
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .background()
//                .ignoresSafeArea()
//
//            Text("Select a symbol")
//                .foregroundStyle(.secondary)
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .background()
//                .ignoresSafeArea()
//                .toolbar {
//                    SmoothieFavoriteButton(smoothie: nil)
//                        .disabled(true)
//                }
        }
    }
    
    #if os(macOS)
    func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
    #endif
                     
                     
}

struct AppSidebarNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppSidebarNavigation()
    }
}
