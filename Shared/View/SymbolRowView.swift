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
            HStack(alignment: .top) {
                VStack {
                    // MARK: - Symbol title
                    HStack {
                        Text(currency.symbol)
                        Text(currency.name)
                    }
                    .customFont(name: "Shabnam", style: .headline, weight: .bold)
                    .dynamicTypeSize(.xSmall ... .medium)
                    .lineLimit(1)
                    .minimumScaleFactor(0.4)
                    .foregroundStyle(.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // MARK: - Updated time
                    // FIXME: The time should be updated frequently
                    Text(currency.globalTime.timeAgoDisplay())
                        .customFont(name: "Shabnam", style: .footnote, weight: .light)
                        .dynamicTypeSize(.xSmall ... .small)
                        .lineLimit(1)
                        .minimumScaleFactor(0.4)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Spacer()
                
                // MARK: - Symbol price
                HStack {
                    Text(currency.currentPrice.formatted(FloatingPointFormatStyle()))
                        .customFont(name: "Shabnam", style: .title2, weight: .bold)
                        .dynamicTypeSize(.xSmall ... .medium)
                        .lineLimit(1)
                        .minimumScaleFactor(0.4)
                        .foregroundStyle(.primary)
                    
                    Text(LocalizedStringKey(currency.toCurrency.rawValue))
                        .customFont(name: "Shabnam", style: .body, weight: .light)
                        .dynamicTypeSize(.xSmall ... .large)
                        .foregroundStyle(.primary)
                }
                
            }
            
            HStack {
                HStack {
                    if currency.status != .stable {
                        Text(currency.priceChange.formatted(FloatingPointFormatStyle()))
                            .customFont(name: "Shabnam", style: .subheadline, weight: .medium)
                        Text(LocalizedStringKey(currency.toCurrency.rawValue))
                            .customFont(name: "Shabnam", style: .footnote, weight: .light)
                    } else {
                        Text("Without change")
                            .customFont(name: "Shabnam", style: .subheadline, weight: .regular)
                    }
                }
                .dynamicTypeSize(.xSmall ... .small)
                .lineLimit(1)
                .minimumScaleFactor(0.4)
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
        .padding()
        .foregroundColor(.white)
        .background(SymbolBackground(status: currency.status))
        .cornerRadius(20, antialiased: true)
    }
}




struct SymbolRowView_Previews: PreviewProvider {
    static var previews: some View {
        
        let currency = CurrencyModel(
            object: "price_dollar_rl",
            name: "USD (Centeral bank)",
            symbol: "🇺🇸",
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
