//
//  SymbolBackground.swift
//  Sarrafi
//
//  Created by armin on 6/17/21.
//

import SwiftUI

struct SymbolBackground: View {
    
    @State var status: SymbolStatus = .stable
    
    var body: some View {
        switch status {
        case .up:
            return LinearGradient(
                colors: [Color(#colorLiteral(red: 0, green: 0.3254901961, blue: 0.4941176471, alpha: 1)), Color(#colorLiteral(red: 0.2274509804, green: 0.631372549, blue: 0.4941176471, alpha: 1))],
                startPoint: UnitPoint(x: 1, y: 1),
                endPoint: UnitPoint(x: 0, y: 0)
            )
        case .stable:
            return LinearGradient(
                colors: [Color(#colorLiteral(red: 0.3098039216, green: 0, blue: 0.737254902, alpha: 1)), Color(#colorLiteral(red: 0.1607843137, green: 0.6705882353, blue: 0.8862745098, alpha: 1))],
                startPoint: UnitPoint(x: 1, y: 1),
                endPoint: UnitPoint(x: 0, y: 0)
            )
        case .down:
            return LinearGradient(
                colors: [Color(#colorLiteral(red: 0.4, green: 0.1764705882, blue: 0.5490196078, alpha: 1)), Color(#colorLiteral(red: 0.9294117647, green: 0.1176470588, blue: 0.4745098039, alpha: 1))],
                startPoint: UnitPoint(x: 1, y: 1),
                endPoint: UnitPoint(x: 0, y: 0)
            )
        }
    }
}

struct SymbolBackground_Previews: PreviewProvider {
    static var previews: some View {
        SymbolBackground()
    }
}
