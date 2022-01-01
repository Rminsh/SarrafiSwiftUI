//
//  SymbolDetailsViewModel.swift
//  Sarrafi
//
//  Created by Armin on 1/1/22.
//

import SwiftUI
import SwiftUICharts

class SymbolDetailsViewModel: ObservableObject {
    
    var currencyProvider: CurrencyService = .shared
    
    @Published var chartsObject: Charts? = nil
    @Published var chartsData: [DataPoint]? = nil
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
            }
        } catch {
            self.error = error as? NetworkingError
            self.hasError = true
        }
        
        DispatchQueue.main.async {
            self.isLoading = false
        }
    }
}
