//
//  SymbolDetailView.swift
//  Sarrafi
//
//  Created by armin on 7/12/21.
//    
//

import SwiftUI

struct SymbolDetailView: View {
    let currency: CurrencyModel
    
    @StateObject var viewModel = SymbolDetailsViewModel()
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        ZStack {
            #if os(macOS)
            if colorScheme == .light {
                Color(nsColor: NSColor.controlBackgroundColor)
                    .edgesIgnoringSafeArea(.all)
            }
            #endif
            
            ScrollView {
                VStack(spacing: 10) {
                    #if os(macOS)
                    // MARK: - Symbol title (Only for macOS)
                    Spacer()
                    Text(currency.name)
                        .customFont(name: "Shabnam", style: .largeTitle, weight: .medium)
                    #endif
                    
                    VStack(spacing: 0) {
                        // MARK: - Symbol price
                        HStack(spacing: 1) {
                            Text(currency.currentPrice.formatted(FloatingPointFormatStyle()))
                            Text(LocalizedStringKey(currency.toCurrency.rawValue))
                        }
                        .customFont(name: "Shabnam", style: .largeTitle, weight: .medium)
                        .dynamicTypeSize(.xSmall ... .medium)
                        
                        // MARK: - Last update of symbol
                        HStack(spacing: 2) {
                            Text("Last update")
                            Text(currency.globalTime.timeAgoDisplay())
                        }
                        .customFont(name: "Shabnam", style: .subheadline, weight: .light)
                        .dynamicTypeSize(.xSmall ... .small)
                    }
                    .padding()
                    
                    // MARK: - Chart
                    ZStack {
                        if viewModel.isLoading {
                            ProgressView()
                        } else if viewModel.hasError {
                            VStack {
                                Text(viewModel.error?.errorDescription ?? "")
                                    .customFont(name: "Shabnam", style: .body)
                                    .foregroundColor(.secondary)
                                    .multilineTextAlignment(.center)
                                    .textSelection(.disabled)
                                
                                Button(action: {
                                    Task.init() {
                                        await viewModel.fetchChart(currency)
                                    }
                                }) {
                                    Text("Try_again")
                                        .customFont(name: "Shabnam", style: .body)
                                        .textSelection(.disabled)
                                }
                                .buttonStyle(.bordered)
                            }
                            .padding()
                        } else {
                            VStack {
                                Picker("", selection: $viewModel.selectedChart) {
                                    ForEach(ChartType.allCases) {
                                        Text(LocalizedStringKey($0.rawValue))
                                            .customFont(name: "Shabnam", style: .body)
                                            .minimumScaleFactor(0.4)
                                            .tag($0)
                                    }
                                }
                                .pickerStyle(.segmented)
                                .onChange(of: viewModel.selectedChart) { _ in
                                    viewModel.loadChart()
                                }
                                
                                Spacer()
                                
                                if let chartsData = viewModel.currentChartsData {
                                    ZStack {}
                                        .frame(height: 200)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    .frame(height: 340)
                    
                    // MARK: - Price Change
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Price Change")
                                .customFont(name: "Shabnam", style: .subheadline, weight: .light)
                                
                            if currency.status != .stable {
                                HStack(spacing: 2) {
                                    Text(currency.priceChange.formatted(FloatingPointFormatStyle()))
                                    Text(LocalizedStringKey(currency.toCurrency.rawValue))
                                    Text(LocalizedStringKey(currency.status.rawValue))
                                }
                                .customFont(name: "Shabnam", style: .headline, weight: .medium)
                                .foregroundColor(viewModel.colorStatus(status: currency.status))
                            } else {
                                Text("Without change")
                                    .customFont(name: "Shabnam", style: .headline, weight: .medium)
                            }
                        }
                        .dynamicTypeSize(.xSmall ... .small)
                        
                        Spacer()
                        
                        switch currency.status {
                        case .up:
                            ProgressBar(
                                progress: Float(currency.percentChange)/100,
                                title: "+\(String(format: "%.2f", currency.percentChange))%"
                            )
                            .frame(maxWidth: 70, maxHeight: 70)
                            
                        case .down:
                            ProgressBar(
                                progress: Float(-currency.percentChange)/100,
                                title: "-\(String(format: "%.2f", currency.percentChange))%"
                            )
                            .frame(maxWidth: 70, maxHeight: 70)
                            
                        case .stable:
                            ProgressBar(
                                progress: Float(currency.percentChange)/100,
                                title: "\(String(format: "%.2f", currency.percentChange))%"
                            )
                            .frame(maxWidth: 70, maxHeight: 70)
                        }
                    }
                    .padding()
                    #if os(iOS)
                    .background(.thinMaterial)
                    #elseif os(macOS)
                    .background(VisualEffectBlur(material: .sidebar, blendingMode: .behindWindow))
                    #endif
                    .cornerRadius(8)
                    .padding(.horizontal)
                    
                    // MARK: - Most and least price of the day
                    HStack {
                        PriceChangeView(
                            status: .up,
                            price: currency.priceUp,
                            toCurrency: currency.toCurrency.rawValue
                        )
                            .frame(maxWidth: .infinity)
                            .padding()
                            #if os(iOS)
                            .background(.thinMaterial)
                            #elseif os(macOS)
                            .background(VisualEffectBlur(material: .sidebar, blendingMode: .behindWindow))
                            #endif
                            .cornerRadius(8)
                        
                        PriceChangeView(
                            status: .down,
                            price: currency.priceDown,
                            toCurrency: currency.toCurrency.rawValue
                        )
                            .frame(maxWidth: .infinity)
                            .padding()
                            #if os(iOS)
                            .background(.thinMaterial)
                            #elseif os(macOS)
                            .background(VisualEffectBlur(material: .sidebar, blendingMode: .behindWindow))
                            #endif
                            .cornerRadius(8)
                            
                    }
                    .padding(.horizontal)
                }
            }
            .refreshable {
                await viewModel.fetchChart(currency)
            }
            .task {
                await viewModel.fetchChart(currency)
            }
            .textSelection(.enabled)
            .foregroundStyle(.primary)
            #if os(iOS)
            .navigationTitle(currency.name)
            #endif
        }

    }
}

struct PriceChangeView: View {
    
    let status: SymbolStatus
    let price: Double
    let toCurrency: String
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: status == .up ? "chevron.up.circle" : "chevron.down.circle")
                .foregroundColor(status == .up ? .green : .red)
                .font(.title)
            
            HStack(spacing: 2) {
                Text(price.formatted(FloatingPointFormatStyle()))
                Text(LocalizedStringKey(toCurrency))
            }
            .customFont(name: "Shabnam", style: .body, weight: .bold)
            .foregroundStyle(.primary)
            
            Text(status == .up ? "Highest price today" : "Lowest price today")
                .customFont(name: "Shabnam", style: .subheadline)
                .foregroundStyle(.secondary)
        }
    }
}


struct SymbolDetailView_Previews: PreviewProvider {
    
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
            NavigationView {
                SymbolDetailView(currency: currency)
            }
            .environment(\.colorScheme, .dark)
            .environment(\.locale, .init(identifier: "fa"))
            .environment(\.layoutDirection, .rightToLeft)
            
            NavigationView {
                SymbolDetailView(currency: currency)
            }
        }
    }
}
