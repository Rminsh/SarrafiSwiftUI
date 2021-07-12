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
        
        navigationAppearance.titleTextAttributes = [
            .foregroundColor: titleColor,
            .font : UIFont(name: fontInLine, size: 20)!
        ]
        navigationAppearance.largeTitleTextAttributes = [
            .foregroundColor: titleColor,
            .font : UIFont(name: fontLarge, size: 32)!
        ]
        
        UINavigationBar.appearance().standardAppearance = navigationAppearance
        UINavigationBar.appearance().compactAppearance = navigationAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance
    }
}

