//
//  CurrencyStruct.swift
//  Sarrafi
//
//  Created by armin on 10/18/19.
//  Copyright © 2021 Sarrafi. All rights reserved.
//

import SwiftUI

// MARK: - Currency Model Class

class CurrencyModel: Identifiable {
    let id              : UUID
    let object			: String
    let name			: LocalizedStringKey
    let symbol          : String
    let currentPrice	: Double
    let toCurrency		: SymbolConvert
    let status			: SymbolStatus
    let priceUp			: Double
    let priceDown		: Double
    let percentChange	: Double
    let priceChange		: Double
    let shamsiTime		: String
    let globalTime      : Date
    
    init(
        object			: String,
        name			: LocalizedStringKey,
        symbol          : String,
        currentPrice	: Double,
        toCurrency		: SymbolConvert,
        status			: SymbolStatus,
        priceUp		: Double,
        priceDown		: Double,
        percentChange	: Double,
        priceChange	: Double,
        shamsiTime		: String,
        globalTime     : Date
    ) {
        self.id             = UUID()
		self.object			= object
		self.name			= name
        self.symbol         = symbol
		self.currentPrice	= currentPrice
		self.toCurrency		= toCurrency
		self.status			= status
		self.priceUp		= priceUp
		self.priceDown		= priceDown
		self.percentChange	= percentChange
		self.priceChange	= priceChange
		self.shamsiTime		= shamsiTime
        self.globalTime     = globalTime
    }
}

// MARK: - CurrencyStruct
struct CurrencyStruct: Codable {
    let current: Current
}

// MARK: - Current
struct Current: Codable {

    let price_dollar_rl			: CurrencyDetail
    let price_dollar_soleymani	: CurrencyDetail
    let price_eur				: CurrencyDetail
    let price_cad				: CurrencyDetail
    let price_aud               : CurrencyDetail
    let price_nzd               : CurrencyDetail
    let price_sgd               : CurrencyDetail
    let price_gbp				: CurrencyDetail
    let price_aed				: CurrencyDetail
    let price_try				: CurrencyDetail
    let price_chf               : CurrencyDetail
    let price_cny				: CurrencyDetail
    let price_jpy				: CurrencyDetail
    let price_afn				: CurrencyDetail
    let price_inr               : CurrencyDetail
    let price_iqd				: CurrencyDetail
    let price_sek               : CurrencyDetail
    let price_myr				: CurrencyDetail
    let price_rub				: CurrencyDetail
    
    let sekee					: CurrencyDetail
    let sekeb					: CurrencyDetail
    let nim						: CurrencyDetail
    let rob						: CurrencyDetail
    let geram24					: CurrencyDetail
    let geram18					: CurrencyDetail
    let mesghal					: CurrencyDetail
    let gerami					: CurrencyDetail
    let ons						: CurrencyDetail
    let silver					: CurrencyDetail
    let gold_mini_size			: CurrencyDetail
    
    let bitcoin					: CurrencyDetail
    let ethereum				: CurrencyDetail
    let ripple					: CurrencyDetail
    let dash					: CurrencyDetail
    let litecoin				: CurrencyDetail
    let stellar					: CurrencyDetail
    
    let oil_usa                 : CurrencyDetail
    let oil_brent               : CurrencyDetail
    let oil_opec                : CurrencyDetail
    let gas_usa                 : CurrencyDetail
    let gas_natural_usa         : CurrencyDetail
    let gasoline_uk             : CurrencyDetail


    enum CodingKeys: String, CodingKey {
        
        // MARK: - Currency
        case price_dollar_rl		// American Dollar
        case price_dollar_soleymani	// Soleymanie Dollar
        case price_eur				// Euro
        case price_cad				// Canada Dollar
        case price_aud              // Australian Dollar
        case price_nzd              // New zealand Dollar
        case price_sgd              // Singapore Dollar
        case price_gbp				// England Pound
        case price_aed				// United Arab Emirates dirham
        case price_try				// Turkish lira
        case price_chf				// Frank
        case price_cny              // Chinese Yuan
        case price_jpy				// Japanese Yen
        case price_afn				// Afghan Afghani
        case price_inr              // Indian Rupee
        case price_iqd				// Iraqi Dinar
        case price_sek				// Krona Sweden
        case price_myr              // Malaysian Ringgit
        case price_rub				// Russian Ruble
        
        
        // MARK: - Gold and Coins
        case sekee			// Seke Emami
        case sekeb			// Seke bahare azadi
        case nim			// Seke nim
        case rob			// Seke rob
        case geram24		// Tala geram 24
        case geram18		// Tala geram 18
        case mesghal		// Tala mesghal
        case gerami			// Seke Gerami
        case ons			// Ons Tala
        case silver			// Noghre
        case gold_mini_size
        
        // MARK: - Digital Currency
        case bitcoin	= "crypto-bitcoin"
        case ethereum	= "crypto-ethereum"
        case ripple		= "crypto-ripple"
        case dash		= "crypto-dash"
        case litecoin	= "crypto-litecoin"
        case stellar	= "crypto-stellar"
        
        // MARK: - Oil and Gas
        case oil_usa         = "oil"
        case oil_brent       = "oil_brent"
        case oil_opec        = "oil_opec"
        case gas_usa         = "general_9"
        case gas_natural_usa = "general_10"
        case gasoline_uk     = "general_11"
        
    }
}

// MARK: - CurrencyDetail
struct CurrencyDetail: Codable {
    let p			: String
    let h			: String
    let l			: String
    let d			: String
    let dp			: Double
    let dt			: String
    let t			: String
    let tEn			: String
    let tG			: String
    let ts			: String
    let settlement	: String?
    let r			: String?

    enum CodingKeys: String, CodingKey {
        case p
        case h
        case l
        case d
        case dp
        case dt
        case t
        case tEn = "t_en"
        case tG = "t-g"
        case ts
        case settlement
        case r
    }
}

enum SymbolStatus: String {
    case up = "Increase"
    case stable = "Stable"
    case down = "Decrease"
}

enum SymbolConvert: String {
    case rial = "Rial"
    case dollar = "Dollar"
}
