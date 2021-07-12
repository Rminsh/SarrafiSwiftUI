//
//  SymbolView.swift
//  Sarrafi
//
//  Created by armin on 6/16/21.
//

import SwiftUI

struct SymbolRowView: View {
    
    @State var title: LocalizedStringKey
    @State var price: Double
    @State var priceHigh: Double
    @State var priceLow: Double
    @State var priceChange: Double
    @State var pricePercentChange: Double
    @State var status: SymbolStatus = .stable
    @State var time: String
    @State var symbolCurrency: SymbolConvert
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                VStack {
                    // MARK: - Symbol title
                    Text(title)
                        .customFont(name: "Shabnam", style: .title3, weight: .medium)
                        .dynamicTypeSize(.xSmall ... .large)
                        .foregroundStyle(.primary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // MARK: - Updated time
                    Text(time)
                        .customFont(name: "Shabnam", style: .footnote, weight: .medium)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Spacer()
                
                // MARK: - Symbol price
                switch symbolCurrency {
                case .rial:
                    Text(LocalizedStringKey("\(Int(price)) Rial"))
                        .customFont(name: "Shabnam", style: .title2, weight: .medium)
                        .dynamicTypeSize(.xSmall ... .large)
                        .foregroundStyle(.primary)
                case .dollar:
                    Text(LocalizedStringKey("\(Int(price)) Dollar"))
                        .customFont(name: "Shabnam", style: .title2, weight: .medium)
                        .dynamicTypeSize(.xSmall ... .large)
                        .foregroundStyle(.primary)
                }
            }
            
            HStack {
                switch symbolCurrency {
                case .rial:
                    Text("\(Int(priceChange)) Rial")
                        .customFont(name: "Shabnam", style: .subheadline, weight: .regular)
                        .foregroundStyle(.primary)
                case .dollar:
                    Text("\(Int(priceChange)) Dollar")
                        .customFont(name: "Shabnam", style: .subheadline, weight: .regular)
                        .foregroundStyle(.primary)
                }
                
                Spacer()
                
                switch status {
                case .up:
                    Label("\(pricePercentChange, specifier: "%.2f")%", systemImage: "chevron.up")
                        .customFont(name: "Shabnam", style: .subheadline, weight: .regular)
                        .foregroundStyle(.secondary)
                case .down:
                    Label("\(pricePercentChange, specifier: "%.2f")%", systemImage: "chevron.down")
                        .customFont(name: "Shabnam", style: .subheadline, weight: .regular)
                        .foregroundStyle(.secondary)
                case .stable:
                    Text("\(pricePercentChange, specifier: "%.0f")%")
                        .customFont(name: "Shabnam", style: .subheadline, weight: .regular)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .foregroundColor(.white)
        .background(SymbolBackground(status: status))
    }
}




struct SymbolRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SymbolRowView(
                title: "USD",
                price: 241850,
                priceHigh: 242250,
                priceLow:239450,
                priceChange: 1360,
                pricePercentChange: 0.57,
                status: .up,
                time: "2021-06-16 19:59:49",
                symbolCurrency: .rial
            )
            
        }
        .previewLayout(.fixed(width: 450, height: 120))
    }
}
