//
//  Theme.swift
//  Sarrafi (iOS)
//
//  Created by armin on 7/12/21.
//

import UIKit

class Theme {
    static func setTheme(
        fontNormal: String,
        fontInLine: String,
        fontLarge: String,
        background : UIColor?,
        titleColor : UIColor = .label
    ){
        // MARK: - NavigationBar
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.configureWithOpaqueBackground()
        navigationAppearance.backgroundColor = background ?? .clear
        
        navigationAppearance.largeTitleTextAttributes = [
            .foregroundColor: titleColor,
            .font : UIFont(name: fontLarge, size: 32)!
        ]
        
        let normalTextAttributes = [
            NSAttributedString.Key.foregroundColor: titleColor,
            NSAttributedString.Key.font : UIFont(name: fontInLine, size: 20)!
        ]
        
        navigationAppearance.titleTextAttributes = normalTextAttributes
        
        UINavigationBar.appearance().standardAppearance = navigationAppearance
        UINavigationBar.appearance().compactAppearance = navigationAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance
        
        UIBarButtonItem.appearance().setTitleTextAttributes(normalTextAttributes, for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes(normalTextAttributes, for: .highlighted)
        UIBarButtonItem.appearance().setTitleTextAttributes(normalTextAttributes, for: .focused)
        
        UINavigationBar.appearance().backItem?.standardAppearance?.titleTextAttributes = normalTextAttributes
        UINavigationBar.appearance().backItem?.compactAppearance?.titleTextAttributes = normalTextAttributes
        UINavigationBar.appearance().backItem?.scrollEdgeAppearance?.titleTextAttributes = normalTextAttributes
        UINavigationBar.appearance().backItem?.compactScrollEdgeAppearance?.titleTextAttributes = normalTextAttributes
        
        // MARK: - TabBar
        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont.init(name: fontInLine, size: 10)! ], for: .normal)
        
        // MARK: - SearchBar
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).attributedPlaceholder = NSAttributedString(
            string: "Search",
            attributes: [
                .foregroundColor: UIColor.secondaryLabel,
                .font : UIFont(name: fontNormal, size: 16)!
            ]
        )
        
        // MARK: - Search bar cancel button
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes([.font : UIFont(name: fontNormal, size: 16)!
        ], for: .normal)
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).title = "Cancel"
        
        // MARK: - UISegmentedControl
        UISegmentedControl.appearance().setTitleTextAttributes([.font : UIFont(name: fontNormal, size: 16)!], for: .normal)
    }
}

