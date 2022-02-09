//
//  ContentView.swift
//  Shared
//
//  Created by armin on 6/16/21.
//

import SwiftUI

struct SymbolView: View {
    
    @State var type: GlobalCurrencyType
    
    @StateObject var viewModel = SymbolListViewModel()
    
    #if os(macOS)
    @SceneStorage("viewMode") private var mode: ViewMode = .gallery
    enum ViewMode: String, CaseIterable, Identifiable {
        var id: Self { self }
        case table
        case gallery
    }
    #endif
    
    var body: some View {
        ZStack {
            #if os(iOS)
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            
            SymbolListView()
                .environmentObject(viewModel)
                .overlay {
                    if viewModel.currencyList.isEmpty {
                        loaderState
                    }
                }
            #endif
            
            #if os(macOS)
            Group {
                switch mode {
                case .table:
                    CurrencyTableView()
                        .environmentObject(viewModel)
                        .overlay {
                            if viewModel.currencyList.isEmpty {
                                loaderState
                            }
                        }
                case .gallery:
                    NavigationView {
                        SymbolListView()
                            .environmentObject(viewModel)
                            .frame(minWidth: 320)
                            .overlay {
                                if viewModel.currencyList.isEmpty {
                                    loaderState
                                }
                            }
                    }
                }
            }
            .toolbar {
                DisplayModePicker(mode: $mode)
            }
            #endif
        }
        .refreshable {
            await viewModel.fetchList(type: type)
        }
        .task {
            await viewModel.fetchList(type: type)
        }
    }
    
    var loaderState: some View {
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

struct SymbolView_Previews: PreviewProvider {
    static var previews: some View {
        SymbolView(type: .cash)
    }
}
