//
//  CurrencyListResponse.swift
//  Sarrafi
//
//  Created by armin on 5/8/20.
//  Copyright © 2021 shalchian. All rights reserved.
//

import SwiftUI

enum GlobalCurrencyType {
    case cash
    case gold
    case crypto
    case oil
}

struct CurrencyListResponse {
    var cashStats   = [CurrencyModel]()
    var goldStats   = [CurrencyModel]()
    var cryptoStats = [CurrencyModel]()
    var oilStats    = [CurrencyModel]()
    
    init(currencyStruct: CurrencyStruct) {
        
        // MARK: - Currency
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_dollar_rl,
            currencyName: Current.CodingKeys.price_dollar_rl.rawValue,
            title: "USD (Centeral bank)",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_dollar_soleymani,
            currencyName: Current.CodingKeys.price_dollar_soleymani.rawValue,
            title: "USD (Soleymanie)",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_eur,
            currencyName: Current.CodingKeys.price_eur.rawValue,
            title: "EUR",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_cad,
            currencyName: Current.CodingKeys.price_cad.rawValue,
            title: "CAD",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_aud,
            currencyName: Current.CodingKeys.price_aud.rawValue,
            title: "AUD",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_nzd,
            currencyName: Current.CodingKeys.price_nzd.rawValue,
            title: "NZD",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_sgd,
            currencyName: Current.CodingKeys.price_sgd.rawValue,
            title: "SGD",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_gbp,
            currencyName: Current.CodingKeys.price_gbp.rawValue,
            title: "GBP",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_aed,
            currencyName: Current.CodingKeys.price_aed.rawValue,
            title: "AED",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_try,
            currencyName: Current.CodingKeys.price_try.rawValue,
            title: "TRY",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_chf,
            currencyName: Current.CodingKeys.price_chf.rawValue,
            title: "CHF",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_cny,
            currencyName: Current.CodingKeys.price_cny.rawValue,
            title: "CNY",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_jpy,
            currencyName: Current.CodingKeys.price_jpy.rawValue,
            title: "JPY",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_afn,
            currencyName: Current.CodingKeys.price_afn.rawValue,
            title: "AFN",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_inr,
            currencyName: Current.CodingKeys.price_inr.rawValue,
            title: "INR",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_iqd,
            currencyName: Current.CodingKeys.price_iqd.rawValue,
            title: "IQD",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_sek,
            currencyName: Current.CodingKeys.price_sek.rawValue,
            title: "SEK",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_myr,
            currencyName: Current.CodingKeys.price_myr.rawValue,
            title: "MYR",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_rub,
            currencyName: Current.CodingKeys.price_rub.rawValue,
            title: "RUB",
            toCurrency: .rial
        )
        
        // MARK: - Gold and Coins
        addObj(
            type: .gold,
            currencyObject: currencyStruct.current.sekee,
            currencyName: Current.CodingKeys.sekee.rawValue,
            title: "New Coin",
            toCurrency: .rial
        )
        
        addObj(
            type: .gold,
            currencyObject: currencyStruct.current.sekeb,
            currencyName: Current.CodingKeys.sekeb.rawValue,
            title: "Old Coin",
            toCurrency: .rial
        )
        
        addObj(
            type: .gold,
            currencyObject: currencyStruct.current.nim,
            currencyName: Current.CodingKeys.nim.rawValue,
            title: "Coin / Half",
            toCurrency: .rial
        )
        
        addObj(
            type: .gold,
            currencyObject: currencyStruct.current.rob,
            currencyName: Current.CodingKeys.rob.rawValue,
            title: "Coin / Quarter",
            toCurrency: .rial
        )
        
        addObj(
            type: .gold,
            currencyObject: currencyStruct.current.gerami,
            currencyName: Current.CodingKeys.gerami.rawValue,
            title: "Coin / Gram",
            toCurrency: .rial
        )
        
        addObj(
            type: .gold,
            currencyObject: currencyStruct.current.geram24,
            currencyName: Current.CodingKeys.geram24.rawValue,
            title: "Gold 24",
            toCurrency: .rial
        )
        
        addObj(
            type: .gold,
            currencyObject: currencyStruct.current.geram18,
            currencyName: Current.CodingKeys.geram18.rawValue,
            title: "Gold 18",
            toCurrency: .rial
        )
        
        addObj(
            type: .gold,
            currencyObject: currencyStruct.current.mesghal,
            currencyName: Current.CodingKeys.mesghal.rawValue,
            title: "Mesghal",
            toCurrency: .rial
        )
        
        addObj(
            type: .gold,
            currencyObject: currencyStruct.current.ons,
            currencyName: Current.CodingKeys.ons.rawValue,
            title: "Gold",
            toCurrency: .dollar
        )
        
        addObj(
            type: .gold,
            currencyObject: currencyStruct.current.silver,
            currencyName: Current.CodingKeys.silver.rawValue,
            title: "Silver",
            toCurrency: .dollar
        )
        
        // MARK: - Digital Currency
        addObj(
            type: .crypto,
            currencyObject: currencyStruct.current.bitcoin,
            currencyName: Current.CodingKeys.bitcoin.rawValue,
            title: "Bitcoin",
            toCurrency: .dollar
        )
        
        addObj(
            type: .crypto,
            currencyObject: currencyStruct.current.ethereum,
            currencyName: Current.CodingKeys.ethereum.rawValue,
            title: "Ethereum",
            toCurrency: .dollar
        )
        
        addObj(
            type: .crypto,
            currencyObject: currencyStruct.current.ripple,
            currencyName: Current.CodingKeys.ripple.rawValue,
            title: "Ripple",
            toCurrency: .dollar
        )
        
        addObj(
            type: .crypto,
            currencyObject: currencyStruct.current.dash,
            currencyName: Current.CodingKeys.dash.rawValue,
            title: "Dash",
            toCurrency: .dollar
        )
        
        addObj(
            type: .crypto,
            currencyObject: currencyStruct.current.litecoin,
            currencyName: Current.CodingKeys.litecoin.rawValue,
            title: "Litecoin",
            toCurrency: .dollar
        )
        
        addObj(
            type: .crypto,
            currencyObject: currencyStruct.current.stellar,
            currencyName: Current.CodingKeys.stellar.rawValue,
            title: "Stellar",
            toCurrency: .dollar
        )
        
        // MARK: - Oil and Gas
        addObj(
            type: .oil,
            currencyObject: currencyStruct.current.oil_usa,
            currencyName: Current.CodingKeys.oil_usa.rawValue,
            title: "Oil USA",
            toCurrency: .dollar
        )
        
        addObj(
            type: .oil,
            currencyObject: currencyStruct.current.oil_brent,
            currencyName: Current.CodingKeys.oil_brent.rawValue,
            title: "Oil Brent",
            toCurrency: .dollar
        )
        
        addObj(
            type: .oil,
            currencyObject: currencyStruct.current.oil_opec,
            currencyName: Current.CodingKeys.oil_opec.rawValue,
            title: "Oil Opec",
            toCurrency: .dollar
        )
        
        addObj(
            type: .oil,
            currencyObject: currencyStruct.current.gas_usa,
            currencyName: Current.CodingKeys.gas_usa.rawValue,
            title: "Gas USA",
            toCurrency: .dollar
        )
        
        addObj(
            type: .oil,
            currencyObject: currencyStruct.current.gas_natural_usa,
            currencyName: Current.CodingKeys.gas_natural_usa.rawValue,
            title: "Natural Gas USA",
            toCurrency: .dollar
        )
        
        addObj(
            type: .oil,
            currencyObject: currencyStruct.current.gasoline_uk,
            currencyName: Current.CodingKeys.gasoline_uk.rawValue,
            title: "Gasoline UK",
            toCurrency: .dollar
        )
    }
    
    mutating func addObj(
        type: GlobalCurrencyType,
        currencyObject: CurrencyDetail,
        currencyName: String,
        title: String,
        toCurrency: SymbolConvert
    ) {
        switch type {
        case .cash:
            cashStats.append(CurrencyModel(
                object: currencyName,
                title: LocalizedStringKey(title),
                currentPrice: convertPrice(currencyObject.p),
                toCurrency: toCurrency,
                status: convertStatus(currencyObject.dt),
                priceUp: convertPrice(currencyObject.h),
                priceDown: convertPrice(currencyObject.l),
                percentChange: currencyObject.dp,
                priceChange: convertPrice(currencyObject.d),
                shamsiTime: currencyObject.t,
                globalTime: convertDate(currencyObject.ts))
            )
        case .gold:
            goldStats.append(CurrencyModel(
                object: currencyName,
                title: LocalizedStringKey(title),
                currentPrice: convertPrice(currencyObject.p),
                toCurrency: toCurrency,
                status: convertStatus(currencyObject.dt),
                priceUp: convertPrice(currencyObject.h),
                priceDown: convertPrice(currencyObject.l),
                percentChange: currencyObject.dp,
                priceChange: convertPrice(currencyObject.d),
                shamsiTime: currencyObject.t,
                globalTime: convertDate(currencyObject.ts))
            )
        case .crypto:
            cryptoStats.append(CurrencyModel(
                object: currencyName,
                title: LocalizedStringKey(title),
                currentPrice: convertPrice(currencyObject.p),
                toCurrency: toCurrency,
                status: convertStatus(currencyObject.dt),
                priceUp: convertPrice(currencyObject.h),
                priceDown: convertPrice(currencyObject.l),
                percentChange: currencyObject.dp,
                priceChange: convertPrice(currencyObject.d),
                shamsiTime: currencyObject.t,
                globalTime: convertDate(currencyObject.ts))
            )
        case .oil:
            oilStats.append(CurrencyModel(
                object: currencyName,
                title: LocalizedStringKey(title),
                currentPrice: convertPrice(currencyObject.p),
                toCurrency: toCurrency,
                status: convertStatus(currencyObject.dt),
                priceUp: convertPrice(currencyObject.h),
                priceDown: convertPrice(currencyObject.l),
                percentChange: currencyObject.dp,
                priceChange: convertPrice(currencyObject.d),
                shamsiTime: currencyObject.t,
                globalTime: convertDate(currencyObject.ts))
            )
        }
    }
    
    private func convertStatus(_ input: String) -> SymbolStatus {
        switch input {
        case "high":
            return SymbolStatus.up
        case "low":
            return SymbolStatus.down
        default:
            return SymbolStatus.stable
        }
    }
    
    private func convertPrice(_ value: String) -> Double {
        return NSString(string: value.replacingOccurrences(of: ",", with: "")).doubleValue
    }
    
    private func convertDate(_ globalTime: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.date(from: globalTime) ?? Date()
    }
}
