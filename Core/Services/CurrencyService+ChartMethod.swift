//
//  CurrencyService+ChartMethod.swift
//  Sarrafi
//
//  Created by Omid Golparvar on 10/4/20.
//  Copyright © 2020 shalchian. All rights reserved.
//

import Foundation

extension CurrencyService {
    
    func getChart(for currency: CurrencyModel) async throws -> Charts {
        var urlChart = URLComponents(string: Constants.SymbolTableAPI)!
        let session = URLSession.shared
        
        
        urlChart.queryItems = [
            URLQueryItem(name: "act", value: "chart-api"),
            URLQueryItem(name: "noview", value: "null"),
            URLQueryItem(name: "client", value: "app"),
            URLQueryItem(name: "appversion", value: "3"),
            URLQueryItem(name: "name", value: currency.object)
        ]
        
        var request = URLRequest(url: urlChart.url!)
        request.httpMethod = "GET"
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        guard let (data, response) = try? await session.data(for: request),
              let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200
        else {
            logger.debug("Failed to fetch data.")
            throw NetworkingError.badNetworkingRequest
        }
        
        do {
            let chart = try JSONDecoder().decode(ChartStruct.self, from: data)
            
            let chart_Day            : [NormalTable]?
            let chart_Month          : [NormalTable]?
            let chart_ThreeMonths    : [NormalTable]?
            let chart_SixMonths      : [NormalTable]?
            let chart_Summary        : [NormalTable]?
            
            // Get Today chart
            var tempChartDay = [NormalTable]()
            for item in chart.today_table.reversed() {
                let price = Double(item.price.replacingOccurrences(of: ",", with: "", options: .literal, range: nil))
                tempChartDay.append(NormalTable(jdate: item.time, value: price ?? 0))
            }
            chart_Day = tempChartDay
            
            // Get Monthly Chart
            let chart_1 = "[" + chart.chart_1.replaceFirst(of: ".$", with: "") + "]"
            if let chart_1_data = chart_1.data(using: .utf8),
               let chart_1_table = try? JSONDecoder().decode([NormalTable].self, from: chart_1_data) {
                chart_Month = chart_1_table
            } else {
                chart_Month = nil
            }
            
            // Get 3 Months Chart
            let chart_3 = "[" + chart.chart_3.replaceFirst(of: ".$", with: "") + "]"
            if let chart_3_data = chart_3.data(using: .utf8),
               let chart_3_table = try? JSONDecoder().decode([NormalTable].self, from: chart_3_data) {
                chart_ThreeMonths = chart_3_table
            } else {
                chart_ThreeMonths = nil
            }
            
            // Get 6 Months Chart
            let chart_6 = "[" + chart.chart_6.replaceFirst(of: ".$", with: "") + "]"
            if let chart_6_data = chart_6.data(using: .utf8),
               let chart_6_table = try? JSONDecoder().decode([NormalTable].self, from: chart_6_data) {
                chart_SixMonths = chart_6_table
            } else {
                chart_SixMonths = nil
            }
            
            //Get Chart Summery
            let chart_summary = "[" + chart.chart_summary + "]"
            if let chart_summary_data = chart_summary.data(using: .utf8),
               let chart_summary_table = try? JSONDecoder().decode([NormalTable].self, from: chart_summary_data) {
                chart_Summary = chart_summary_table
            } else {
                chart_Summary = nil
            }
            
            guard let _0 = chart_Day,
                  let _1 = chart_Month,
                  let _2 = chart_ThreeMonths,
                  let _3 = chart_SixMonths,
                  let _4 = chart_Summary
            else {
                throw NetworkingError.errorParse
            }
            
            let charts = Charts(day: _0, month: _1, threeMonths: _2, sixMonths: _3, summary: _4)
            return charts
            
        } catch {
            print(error)
            throw NetworkingError.errorParse
        }
    }
    
}

extension String {
    public func replaceFirst(of pattern:String, with replacement:String) -> String {
        if let range = self.range(of: pattern) {
            return self.replacingCharacters(in: range, with: replacement)
        } else {
            return self
        }
    }
}
