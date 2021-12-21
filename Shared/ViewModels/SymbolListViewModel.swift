//
//  SymbolListViewModel.swift
//  Sarrafi
//
//  Created by Armin on 12/21/21.
//

import Foundation

class SymbolListViewModel: ObservableObject {
    
    var currencyProvider: CurrencyService = .shared
    
    @Published var currencyList = [CurrencyModel]()
    @Published var isLoading = false
    @Published var error: NetworkingError?
    @Published var hasError = false
    
    func fetchList(type: GlobalCurrencyType) async {
        hasError = false
        isLoading = true
        do {
            let response = try await currencyProvider.fetchData()
            DispatchQueue.main.async { [self] in
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
}
