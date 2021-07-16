//
//  CurrencyService.swift
//  Sarrafi
//
//  Created by armin on 6/20/21.
//

import Foundation
import OSLog

class CurrencyService {
    
    static let shared = CurrencyService()
    
    let logger = Logger(subsystem: Constants.AppID, category: "persistence")
    let url = URL(string: Constants.SymbolListAPI)!
    
    func fetchData() async throws -> CurrencyListResponse {
        
        let session = URLSession.shared
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        
        guard let (data, response) = try? await session.data(for: request),
              let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200
        else {
            logger.debug("Failed to fetch data.")
            throw NetworkingError.badNetworkingRequest
        }

        do {
            let currencyStruct = try JSONDecoder().decode(CurrencyStruct.self, from: data)
            let result = CurrencyListResponse(currencyStruct: currencyStruct)
            logger.debug("Finished getting latest data.")
            return result
        } catch {
            print(error)
            throw NetworkingError.errorParse
        }
    }
}
