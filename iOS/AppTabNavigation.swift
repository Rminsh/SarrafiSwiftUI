/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Tab based app structure.
*/

import SwiftUI

struct AppTabNavigation: View {

    @State private var selection: NavigationItem? = .cash

    var body: some View {
        TabView(selection: $selection) {
            
            // MARK: - Currencies price
            SymbolListView(type: .cash)
            .tabItem {
                let menuText = Text(NavigationItem.cash.name, comment: NavigationItem.cash.comment)
                Label {
                    menuText
                } icon: {
                    Image(systemName: NavigationItem.cash.icon)
                }.accessibility(label: menuText)
            }
            .tag(NavigationItem.cash)
            
            // MARK: - Gold and coins price
            SymbolListView(type: .gold)
            .tabItem {
                let menuText = Text(NavigationItem.gold.name, comment: NavigationItem.gold.comment)
                Label {
                    menuText
                } icon: {
                    Image(systemName: NavigationItem.gold.icon)
                }
            }
            .tag(NavigationItem.gold)
            
            // MARK: - Cryptocurrencies price
            SymbolListView(type: .crypto)
            .tabItem {
                let menuText = Text(NavigationItem.crypto.name, comment: NavigationItem.crypto.comment)
                Label {
                    menuText
                } icon: {
                    Image(systemName: NavigationItem.crypto.icon)
                }
            }
            .tag(NavigationItem.crypto)
            
            // MARK: - Oil and gas price
            SymbolListView(type: .oil)
            .tabItem {
                let menuText = Text(NavigationItem.oil.name, comment: NavigationItem.oil.comment)
                Label {
                    menuText
                } icon: {
                    Image(systemName: NavigationItem.oil.icon)
                }
            }
            .tag(NavigationItem.oil)
        }
    }
}

struct AppTabNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppTabNavigation()
    }
}
