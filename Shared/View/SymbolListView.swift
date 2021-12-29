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
            ForEach(viewModel.currencyList, id: \.id) { currency in
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
    }
}

struct SymbolListView_Previews: PreviewProvider {
    static var previews: some View {
        SymbolListView()
    }
}
