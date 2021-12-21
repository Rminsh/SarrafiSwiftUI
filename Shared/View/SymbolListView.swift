//
//  ContentView.swift
//  Shared
//
//  Created by armin on 6/16/21.
//

import SwiftUI

struct SymbolListView: View {
    
    @State var type: GlobalCurrencyType
    @StateObject var viewModel = SymbolListViewModel()
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            content
        }
    }
    
    var content: some View {
        List {
            ForEach(viewModel.currencyList, id: \.id) { currency in
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
            if viewModel.currencyList.isEmpty {
                ZStack {
                    if viewModel.isLoading {
                        ProgressView()
                    }
                    
                    if viewModel.hasError {
                        VStack {
                            Text(viewModel.error?.errorDescription ?? "")
                                .customFont(name: "Shabnam", style: .body)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.center)
                            
                            Button(action: {
                                Task.init() {
                                    await viewModel.fetchList(type: type)
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
            await viewModel.fetchList(type: type)
        }
        .task {
            await viewModel.fetchList(type: type)
        }
    }
}

struct SymbolListView_Previews: PreviewProvider {
    static var previews: some View {
        SymbolListView(type: .cash)
    }
}
