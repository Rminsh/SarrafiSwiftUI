//
//  ContentView.swift
//  Shared
//
//  Created by armin on 6/16/21.
//

import SwiftUI

struct SymbolListView: View {
    
    var currencyProvider: CurrencyService = .shared
    @State var currencyList = [CurrencyModel]()
    @State var type: GlobalCurrencyType
    
    @State private var isLoading = false
    @State private var error: NetworkingError?
    @State private var hasError = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(currencyList, id: \.id) { currency in
                    SymbolRowView(
                        title: currency.title,
                        price: currency.currentPrice,
                        priceHigh: currency.priceUp,
                        priceLow: currency.priceDown,
                        priceChange: currency.priceChange,
                        pricePercentChange: currency.percentChange,
                        status: currency.status,
                        time: currency.globalTime,
                        symbolCurrency: currency.toCurrency
                    )
                        .cornerRadius(12)
                        #if os(iOS)
                        .listRowSeparator(.hidden)
                        #endif
                }
            }
            .overlay {
                if currencyList.isEmpty {
                    ZStack {
                        if isLoading {
                            ProgressView()
                        }
                        
                        if hasError {
                            VStack {
                                Text(error?.errorDescription ?? "")
                                    .foregroundColor(.secondary)
                                    .multilineTextAlignment(.center)
                                
                                Button(action: {
                                    #if os(iOS)
                                    async {
                                        await fetchList()
                                    }
                                    #elseif os(macOS)
                                    Task.init() {
                                        await fetchList()
                                    }
                                    #endif
                                }) {
                                    Text("Try_again")
                                }
                                .buttonStyle(.bordered)
                            }
                            .padding()
                        }
                    }
                }
            }
            .refreshable {
                await fetchList()
            }
            .task {
                await fetchList()
            }
            .listStyle(.plain)
            #if os(macOS)
            .frame(minWidth: 325)
            #endif
            .navigationTitle("APP_NAME")
        }
        
    }
}

extension SymbolListView {
    private func fetchList() async {
        hasError = false
        isLoading = true
        do {
            let response = try await currencyProvider.fetchData()
            switch type {
            case .cash:
                currencyList = response.cashStats
            case .gold:
                currencyList = response.goldStats
            case .crypto:
                currencyList = response.cryptoStats
            case .oil:
                currencyList = response.oilStats
            }
        } catch {
            self.error = error as? NetworkingError
            self.hasError = true
        }
        isLoading = false
    }
}

struct SymbolListView_Previews: PreviewProvider {
    static var previews: some View {
        SymbolListView(type: .cash)
    }
}
