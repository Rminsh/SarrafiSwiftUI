//
//  CurrencyTableView.swift
//  Sarrafi (macOS)
//
//  Created by Armin on 12/29/21.
//

import SwiftUI

struct CurrencyTableView: View {
    
    @EnvironmentObject var viewModel: SymbolListViewModel
    
    @State var sortOrder: [KeyPathComparator<CurrencyModel>] = [
        .init(\.id, order: SortOrder.forward)
    ]
    
    var body: some View {
        
        Table(currencyList, sortOrder: $sortOrder) {
            TableColumn("❖", value: \.symbol)
                .width(20)
            // TODO: Cannot sort by name (Because the value is the type of `LocalizedStringKey`)
            TableColumn("Currency name") { currency in
                Text(currency.name)
                    .customFont(name: "Shabnam", style: .body, weight: .regular)
            }
            .width(min: 150)
            
            TableColumn("Price", value: \.currentPrice) { currency in
                let toCurrency = LocalizedStringKey(currency.toCurrency.rawValue).stringValue(locale: Locale(identifier: Locale.preferredLanguages.first!))
                Text("\(currency.currentPrice.formatted()) \(toCurrency)")
                    .customFont(name: "Shabnam", style: .body, weight: .regular)
            }
            .width(min: 100)
            
            TableColumn("Price Changes", value: \.percentChange) { currency in
                let toCurrency = LocalizedStringKey(currency.toCurrency.rawValue).stringValue(locale: Locale(identifier: Locale.preferredLanguages.first!))
                switch currency.status {
                case .up:
                    Text("\(currency.percentChange, specifier: "%.2f")% ↑   \(currency.priceChange.clean) \(toCurrency)")
                        .customFont(name: "Shabnam", style: .body, weight: .regular)
                        .foregroundColor(.white)
                        .padding(.horizontal, 5)
                        .background(Capsule().fill(Color.green))
                case .down:
                    Text("\(currency.percentChange, specifier: "%.2f")% ↓   \(currency.priceChange.clean) \(toCurrency)")
                        .customFont(name: "Shabnam", style: .body, weight: .regular)
                        .foregroundColor(.white)
                        .padding(.horizontal, 5)
                        .background(Capsule().fill(Color.red))
                case .stable:
                    Text("Without change")
                        .customFont(name: "Shabnam", style: .body, weight: .regular)
                }
            }
            .width(min: 150)
            
            TableColumn("Last update", value: \.globalTime) { currency in
                // TODO: Persian locale is not displaying
                Text(currency.globalTime.formatted(date: .numeric, time: .shortened))
                    .customFont(name: "Shabnam", style: .body, weight: .regular)
            }
            .width(min: 150)
        }
        .searchable(
            text: $viewModel.searchText,
            prompt: Text(LocalizedStringKey("Search"))
        )
    }
}

extension CurrencyTableView {
    var currencyList: [CurrencyModel] {
        return viewModel.currencyList
            .filter {
                return viewModel.searchText.isEmpty ? true : $0.name.toString().contains(viewModel.searchText)
            }
            .sorted(using: sortOrder)
    }
}

struct CurrencyTableView_Previews: PreviewProvider {
    
    @StateObject static var viewModel = SymbolListViewModel()
    
    static var previews: some View {
        CurrencyTableView()
            .environmentObject(viewModel)
    }
}
