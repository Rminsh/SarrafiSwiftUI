//
//  MagnifierRect.swift
//  
//
//  Created by Samu András on 2020. 03. 04..
//

import SwiftUI

public struct MagnifierRect: View {
    @Binding var currentNumber: Double
    var valueSpecifier:String
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    public var body: some View {
        ZStack{
            VStack {
                Text("\(self.currentNumber, specifier: valueSpecifier)")
                    .customFont(name: "Shabnam-Bold", style: .body)
                    .foregroundColor(self.colorScheme == .dark ? Color.white : Color.black)
                    .padding(.horizontal)
                
                Spacer()
            }
            .padding(.horizontal, 5)
            .padding(.top, 15)
            if (self.colorScheme == .dark) {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.white, lineWidth: self.colorScheme == .dark ? 2 : 0)
                    .frame(height: 300)
            } else {
                RoundedRectangle(cornerRadius: 16)
                    .frame(height: 300)
                    .foregroundColor(Color.white)
                    .shadow(color: Colors.LegendText, radius: 12, x: 0, y: 6 )
                    .blendMode(.multiply)
            }
        }
        .fixedSize()
        .offset(x: 0, y: -15)
    }
}