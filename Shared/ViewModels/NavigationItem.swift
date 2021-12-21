//
//  NavigationItem.swift
//  Sarrafi
//
//  Created by armin on 6/21/21.
//

import SwiftUI

struct NavigationItem: Identifiable {
    let id = UUID().uuidString
    let name: LocalizedStringKey
    let comment: LocalizedStringKey
    let icon: String
    let content: SymbolListView
}

final class NavigationItemsModel: ObservableObject {
    
    @Published var navigationItems: [NavigationItem]
    @Published var selectedId: String?
    
    init(navigationItems: [NavigationItem] = NavigationItemsModel.defaultItems) {
        self.navigationItems = navigationItems
        self.selectedId = navigationItems[0].id
    }
    
    static let defaultItems: [NavigationItem] = [
        NavigationItem(
            name: "Cash",
            comment: "List of exchange rates",
            icon: "dollarsign.circle",
            content: SymbolListView(type: .cash)
        ),
        
        NavigationItem(
            name: "Gold",
            comment: "List of the gold and coins prices",
            icon: "sparkles.rectangle.stack",
            content: SymbolListView(type: .gold)
        ),
        
        NavigationItem(
            name: "Crypto",
            comment: "List of the crytp currencies prices",
            icon: "bitcoinsign.circle",
            content: SymbolListView(type: .crypto)
        ),
        
        NavigationItem(
            name: "Oil",
            comment: "List of the oil prices",
            icon: "fuelpump",
            content: SymbolListView(type: .oil)
        ),
    ]
}
