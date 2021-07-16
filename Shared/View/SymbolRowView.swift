//
//  SymbolView.swift
//  Sarrafi
//
//  Created by armin on 6/16/21.
//

import SwiftUI

struct SymbolRowView: View {
    
    let currency: CurrencyModel
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                VStack {
                    // MARK: - Symbol title
                    Text(currency.title)
                        .customFont(name: "Shabnam", style: .title3, weight: .medium)
                        .dynamicTypeSize(.xSmall ... .large)
                        .foregroundStyle(.primary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // MARK: - Updated time
                    Text(currency.globalTime.timeAgoDisplay())
                        .customFont(name: "Shabnam", style: .footnote, weight: .medium)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Spacer()
                
                // MARK: - Symbol price
                HStack(spacing: 1) {
                    Text(String(currency.currentPrice.clean))
                    Text(LocalizedStringKey(currency.toCurrency.rawValue))
                }
                .customFont(name: "Shabnam", style: .title2, weight: .medium)
                .dynamicTypeSize(.xSmall ... .large)
                .foregroundStyle(.primary)
            }
            
            HStack {
                HStack(spacing: 1) {
                    if currency.status != .stable {
                        Text(String(currency.priceChange.clean))
                        Text(LocalizedStringKey(currency.toCurrency.rawValue))
                    } else {
                        Text("Without change")
                    }
                }
                .customFont(name: "Shabnam", style: .subheadline, weight: .regular)
                .foregroundStyle(.primary)
                
                Spacer()
                
                switch currency.status {
                case .up:
                    Label("\(currency.percentChange, specifier: "%.2f")%", systemImage: "chevron.up")
                        .customFont(name: "Shabnam", style: .subheadline, weight: .regular)
                        .foregroundStyle(.secondary)
                case .down:
                    Label("\(currency.percentChange, specifier: "%.2f")%", systemImage: "chevron.down")
                        .customFont(name: "Shabnam", style: .subheadline, weight: .regular)
                        .foregroundStyle(.secondary)
                case .stable:
                    Text("\(currency.percentChange, specifier: "%.0f")%")
                        .customFont(name: "Shabnam", style: .subheadline, weight: .regular)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .foregroundColor(.white)
        .background(SymbolBackground(status: currency.status))
    }
}




struct SymbolRowView_Previews: PreviewProvider {
    static var previews: some View {
        
        let currency = CurrencyModel(
            object: "price_dollar_rl",
            title: "USD (Centeral bank)",
            currentPrice: 241850,
            toCurrency: .rial,
            status: .up,
            priceUp: 242250,
            priceDown: 239450,
            percentChange: 0.57,
            priceChange: 1360,
            shamsiTime: "۱۴:۴۷:۳۷",
            globalTime: Date()
        )
        
        Group {
            SymbolRowView(currency: currency)

        }
        .previewLayout(.fixed(width: 450, height: 120))
    }
}
