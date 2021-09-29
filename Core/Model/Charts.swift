//
//  Charts.swift
//  Sarrafi
//
//  Created by Omid Golparvar on 10/4/20.
//  Copyright © 2021 shalchian. All rights reserved.
//

import Foundation

enum ChartType: String, CaseIterable, Identifiable {
    case day         = "Daily"
    case month       = "Monthly"
    case threeMonths = "3 Months"
    case sixMonths   = "6 Months"
    case summery     = "Summery"
    
    var id: String { self.rawValue }
}

struct Charts {
	let day			: ChartItem
	let month		: ChartItem
	let threeMonths	: ChartItem
	let sixMonths	: ChartItem
	let summary		: ChartItem
}

struct ChartItem {
	let dates: [String]
	let prices: [Double]
}
