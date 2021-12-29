//
//  SymbolListView.swift
//  Sarrafi
//
//  Created by Armin on 12/29/21.
//

import SwiftUI

struct SymbolListView: View {
    
    @EnvironmentObject var viewModel: SymbolListViewModel
    
    var body: some View {
        List {
            ForEach(currencyList, id: \.id) { currency in
                ZStack {
                    SymbolRowView(currency: currency)                        
                    NavigationLink(destination: SymbolDetailView(currency: currency)) {
                        EmptyView()
                    }
                    .tint(.clear)
                    .opacity(0)
                }
                #if os(iOS)
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
                #endif
            }
        }
        #if os(iOS)
        .listStyle(.plain)
        #endif
        .searchable(
            text: $viewModel.searchText,
            prompt: Text(LocalizedStringKey("Search"))
        )
    }
}

extension SymbolListView {
    var currencyList: [CurrencyModel] {
        return viewModel.currencyList
            .filter {
                return viewModel.searchText.isEmpty ? true : $0.name.toString().contains(viewModel.searchText)
            }
    }
}

struct SymbolListView_Previews: PreviewProvider {
    static var previews: some View {
        SymbolListView()
    }
}
