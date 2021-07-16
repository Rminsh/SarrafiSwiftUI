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
            ZStack {
                Color("BackgroundColor")
                    .edgesIgnoringSafeArea(.all)
                List {
                    ForEach(currencyList, id: \.id) { currency in
                        ZStack {
                            SymbolRowView(currency: currency)
                                .cornerRadius(12)
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
                .overlay {
                    if currencyList.isEmpty {
                        ZStack {
                            if isLoading {
                                ProgressView()
                            }
                            
                            if hasError {
                                VStack {
                                    Text(error?.errorDescription ?? "")
                                        .customFont(name: "Shabnam", style: .body)
                                        .foregroundColor(.secondary)
                                        .multilineTextAlignment(.center)
                                    
                                    Button(action: {
                                        Task.init() {
                                            await fetchList()
                                        }
                                    }) {
                                        Text("Try_again")
                                            .customFont(name: "Shabnam", style: .body)
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
            }
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
