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
	let day			: [NormalTable]
	let month		: [NormalTable]
	let threeMonths	: [NormalTable]
	let sixMonths	: [NormalTable]
	let summary		: [NormalTable]
}

struct ChartItem {
	let date: String
	let price: Double
}
