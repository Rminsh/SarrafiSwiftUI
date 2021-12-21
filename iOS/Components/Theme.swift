//
//  Theme.swift
//  Sarrafi (iOS)
//
//  Created by armin on 7/12/21.
//

import UIKit

class Theme {
    static func navigationBar(
        fontInLine: String,
        fontLarge: String,
        background : UIColor?,
        titleColor : UIColor = .label
    ){
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
        
        UIBarButtonItem.appearance().setTitleTextAttributes(normalTextAttributes, for: UIControl.State.normal)
        UIBarButtonItem.appearance().setTitleTextAttributes(normalTextAttributes, for: .highlighted)
        UIBarButtonItem.appearance().setTitleTextAttributes(normalTextAttributes, for: .focused)
        
        UINavigationBar.appearance().backItem?.standardAppearance?.titleTextAttributes = normalTextAttributes
        UINavigationBar.appearance().backItem?.compactAppearance?.titleTextAttributes = normalTextAttributes
        UINavigationBar.appearance().backItem?.scrollEdgeAppearance?.titleTextAttributes = normalTextAttributes
        UINavigationBar.appearance().backItem?.compactScrollEdgeAppearance?.titleTextAttributes = normalTextAttributes
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: fontInLine, size: 10)! ], for: .normal)
    }
}

