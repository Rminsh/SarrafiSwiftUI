//
//  NavigationItem.swift
//  Sarrafi
//
//  Created by armin on 6/21/21.
//

import SwiftUI

enum NavigationItem {
    case cash
    case gold
    case crypto
    case oil
    
    var icon: String {
        switch self {
        case .cash:
            return "dollarsign.circle"
        case .gold:
            return "sparkles.rectangle.stack"
        case .crypto:
            return "bitcoinsign.circle"
        case .oil:
            return "fuelpump"
        }
    }
    
    var name: LocalizedStringKey {
        switch self {
        case .cash:
            return "Cash"
        case .gold:
            return "Gold"
        case .crypto:
            return "Crypto"
        case .oil:
            return "Oil"
        }
    }
    
    var comment: StaticString {
        switch self {
        case .cash:
            return "List of exchange rates"
        case .gold:
            return "List of the gold and coins prices"
        case .crypto:
            return "List of the crytp currencies prices"
        case .oil:
            return "List of the oil prices"
        }
    }
}
