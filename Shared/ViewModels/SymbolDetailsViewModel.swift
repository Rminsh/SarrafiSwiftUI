//
//  SymbolDetailsViewModel.swift
//  Sarrafi
//
//  Created by Armin on 1/1/22.
//

import SwiftUI

class SymbolDetailsViewModel: ObservableObject {
    
    var currencyProvider: CurrencyService = .shared
    
    @Published var chartsObject: Charts? = nil
    @Published var currentChartsData: [Double]? = nil
    @Published var selectedChart = ChartType.month
    
    @Published var isLoading = false
    @Published var error: NetworkingError?
    @Published var hasError = false
    
    func colorStatus(status: SymbolStatus) -> Color {
        switch status {
        case .up:
            return .green
        case .down:
            return .red
        case .stable:
            return .primary
        }
    }
    
    func fetchChart(_ currency: CurrencyModel) async {
        hasError = false
        isLoading = true
        
        do {
            let result = try await currencyProvider.getChart(for: currency)
            DispatchQueue.main.async {
                self.chartsObject = result
                self.loadChart()
            }
        } catch {
            DispatchQueue.main.async {
                self.error = error as? NetworkingError
                self.hasError = true
            }
        }
        
        DispatchQueue.main.async {
            self.isLoading = false
        }
    }
    
    func loadChart() {
        switch selectedChart {
        case .day:
            currentChartsData = chartsObject?.month.prices
        case .month:
            currentChartsData = chartsObject?.month.prices
        case .threeMonths:
            currentChartsData = chartsObject?.threeMonths.prices
        case .sixMonths:
            currentChartsData = chartsObject?.sixMonths.prices
        case .summery:
            currentChartsData = chartsObject?.summary.prices
        }
    }
}
