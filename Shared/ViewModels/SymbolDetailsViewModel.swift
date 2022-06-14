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
    @Published var currentChartsData: [NormalTable]? = nil
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
        DispatchQueue.main.async {
            self.hasError = false
            self.isLoading = true
        }
        
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
            currentChartsData = chartsObject?.day
        case .month:
            currentChartsData = chartsObject?.month
        case .threeMonths:
            currentChartsData = chartsObject?.threeMonths
        case .sixMonths:
            currentChartsData = chartsObject?.sixMonths
        case .summery:
            currentChartsData = chartsObject?.summary
        }
    }
}
