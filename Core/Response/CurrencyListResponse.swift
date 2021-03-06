//
//  CurrencyListResponse.swift
//  Sarrafi
//
//  Created by armin on 5/8/20.
//  Copyright Β© 2021 shalchian. All rights reserved.
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
            symbol: "πΊπΈ",
            toCurrency: .rial
        )
        
        if let price_dollar_soleymani = currencyStruct.current.price_dollar_soleymani {
            addObj(
                type: .cash,
                currencyObject: price_dollar_soleymani,
                currencyName: Current.CodingKeys.price_dollar_soleymani.rawValue,
                title: "USD (Soleymanie)",
                symbol: "πΊπΈ",
                toCurrency: .rial
            )
        }
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_eur,
            currencyName: Current.CodingKeys.price_eur.rawValue,
            title: "EUR",
            symbol: "πͺπΊ",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_cad,
            currencyName: Current.CodingKeys.price_cad.rawValue,
            title: "CAD",
            symbol: "π¨π¦",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_aud,
            currencyName: Current.CodingKeys.price_aud.rawValue,
            title: "AUD",
            symbol: "π¦πΊ",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_nzd,
            currencyName: Current.CodingKeys.price_nzd.rawValue,
            title: "NZD",
            symbol: "π³πΏ",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_sgd,
            currencyName: Current.CodingKeys.price_sgd.rawValue,
            title: "SGD",
            symbol: "πΈπ¬",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_gbp,
            currencyName: Current.CodingKeys.price_gbp.rawValue,
            title: "GBP",
            symbol: "π¬π§",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_aed,
            currencyName: Current.CodingKeys.price_aed.rawValue,
            title: "AED",
            symbol: "π¦πͺ",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_try,
            currencyName: Current.CodingKeys.price_try.rawValue,
            title: "TRY",
            symbol: "πΉπ·",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_chf,
            currencyName: Current.CodingKeys.price_chf.rawValue,
            title: "CHF",
            symbol: "πΉπ·",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_cny,
            currencyName: Current.CodingKeys.price_cny.rawValue,
            title: "CNY",
            symbol: "π¨π­",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_jpy,
            currencyName: Current.CodingKeys.price_jpy.rawValue,
            title: "JPY",
            symbol: "π―π΅",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_afn,
            currencyName: Current.CodingKeys.price_afn.rawValue,
            title: "AFN",
            symbol: "π¦π«",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_inr,
            currencyName: Current.CodingKeys.price_inr.rawValue,
            title: "INR",
            symbol: "π?π³",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_iqd,
            currencyName: Current.CodingKeys.price_iqd.rawValue,
            title: "IQD",
            symbol: "π?πΆ",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_sek,
            currencyName: Current.CodingKeys.price_sek.rawValue,
            title: "SEK",
            symbol: "πΈπͺ",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_myr,
            currencyName: Current.CodingKeys.price_myr.rawValue,
            title: "MYR",
            symbol: "π²πΎ",
            toCurrency: .rial
        )
        
        addObj(
            type: .cash,
            currencyObject: currencyStruct.current.price_rub,
            currencyName: Current.CodingKeys.price_rub.rawValue,
            title: "RUB",
            symbol: "π·πΊ",
            toCurrency: .rial
        )
        
        // MARK: - Gold and Coins
        addObj(
            type: .gold,
            currencyObject: currencyStruct.current.sekee,
            currencyName: Current.CodingKeys.sekee.rawValue,
            title: "New Coin",
            symbol: "π‘",
            toCurrency: .rial
        )
        
        addObj(
            type: .gold,
            currencyObject: currencyStruct.current.sekeb,
            currencyName: Current.CodingKeys.sekeb.rawValue,
            title: "Old Coin",
            symbol: "π‘",
            toCurrency: .rial
        )
        
        addObj(
            type: .gold,
            currencyObject: currencyStruct.current.nim,
            currencyName: Current.CodingKeys.nim.rawValue,
            title: "Coin / Half",
            symbol: "π‘",
            toCurrency: .rial
        )
        
        addObj(
            type: .gold,
            currencyObject: currencyStruct.current.rob,
            currencyName: Current.CodingKeys.rob.rawValue,
            title: "Coin / Quarter",
            symbol: "π‘",
            toCurrency: .rial
        )
        
        addObj(
            type: .gold,
            currencyObject: currencyStruct.current.gerami,
            currencyName: Current.CodingKeys.gerami.rawValue,
            title: "Coin / Gram",
            symbol: "π‘",
            toCurrency: .rial
        )
        
        addObj(
            type: .gold,
            currencyObject: currencyStruct.current.geram24,
            currencyName: Current.CodingKeys.geram24.rawValue,
            title: "Gold 24",
            symbol: "π",
            toCurrency: .rial
        )
        
        addObj(
            type: .gold,
            currencyObject: currencyStruct.current.geram18,
            currencyName: Current.CodingKeys.geram18.rawValue,
            title: "Gold 18",
            symbol: "π",
            toCurrency: .rial
        )
        
        addObj(
            type: .gold,
            currencyObject: currencyStruct.current.mesghal,
            currencyName: Current.CodingKeys.mesghal.rawValue,
            title: "Mesghal",
            symbol: "π‘",
            toCurrency: .rial
        )
        
        addObj(
            type: .gold,
            currencyObject: currencyStruct.current.ons,
            currencyName: Current.CodingKeys.ons.rawValue,
            title: "Gold",
            symbol: "π‘",
            toCurrency: .dollar
        )
        
        addObj(
            type: .gold,
            currencyObject: currencyStruct.current.silver,
            currencyName: Current.CodingKeys.silver.rawValue,
            title: "Silver",
            symbol: "βͺοΈ",
            toCurrency: .dollar
        )
        
        // MARK: - Digital Currency
        addObj(
            type: .crypto,
            currencyObject: currencyStruct.current.bitcoin,
            currencyName: Current.CodingKeys.bitcoin.rawValue,
            title: "Bitcoin",
            symbol: "πͺ",
            toCurrency: .dollar
        )
        
        addObj(
            type: .crypto,
            currencyObject: currencyStruct.current.ethereum,
            currencyName: Current.CodingKeys.ethereum.rawValue,
            title: "Ethereum",
            symbol: "πͺ",
            toCurrency: .dollar
        )
        
        addObj(
            type: .crypto,
            currencyObject: currencyStruct.current.ripple,
            currencyName: Current.CodingKeys.ripple.rawValue,
            title: "Ripple",
            symbol: "πͺ",
            toCurrency: .dollar
        )
        
        addObj(
            type: .crypto,
            currencyObject: currencyStruct.current.dash,
            currencyName: Current.CodingKeys.dash.rawValue,
            title: "Dash",
            symbol: "πͺ",
            toCurrency: .dollar
        )
        
        addObj(
            type: .crypto,
            currencyObject: currencyStruct.current.litecoin,
            currencyName: Current.CodingKeys.litecoin.rawValue,
            title: "Litecoin",
            symbol: "πͺ",
            toCurrency: .dollar
        )
        
        addObj(
            type: .crypto,
            currencyObject: currencyStruct.current.stellar,
            currencyName: Current.CodingKeys.stellar.rawValue,
            title: "Stellar",
            symbol: "πͺ",
            toCurrency: .dollar
        )
        
        // MARK: - Oil and Gas
        addObj(
            type: .oil,
            currencyObject: currencyStruct.current.oil_usa,
            currencyName: Current.CodingKeys.oil_usa.rawValue,
            title: "Oil USA",
            symbol: "πΊπΈ",
            toCurrency: .dollar
        )
        
        addObj(
            type: .oil,
            currencyObject: currencyStruct.current.oil_brent,
            currencyName: Current.CodingKeys.oil_brent.rawValue,
            title: "Oil Brent",
            symbol: "π¬π§",
            toCurrency: .dollar
        )
        
        addObj(
            type: .oil,
            currencyObject: currencyStruct.current.oil_opec,
            currencyName: Current.CodingKeys.oil_opec.rawValue,
            title: "Oil Opec",
            symbol: "π?π·",
            toCurrency: .dollar
        )
        
        addObj(
            type: .oil,
            currencyObject: currencyStruct.current.gas_usa,
            currencyName: Current.CodingKeys.gas_usa.rawValue,
            title: "Gas USA",
            symbol: "πΊπΈ",
            toCurrency: .dollar
        )
        
        addObj(
            type: .oil,
            currencyObject: currencyStruct.current.gas_natural_usa,
            currencyName: Current.CodingKeys.gas_natural_usa.rawValue,
            title: "Natural Gas USA",
            symbol: "πΊπΈ",
            toCurrency: .dollar
        )
        
        addObj(
            type: .oil,
            currencyObject: currencyStruct.current.gasoline_uk,
            currencyName: Current.CodingKeys.gasoline_uk.rawValue,
            title: "Gasoline UK",
            symbol: "π¬π§",
            toCurrency: .dollar
        )
    }
    
    mutating func addObj(
        type: GlobalCurrencyType,
        currencyObject: CurrencyDetail,
        currencyName: String,
        title: String,
        symbol: String,
        toCurrency: SymbolConvert
    ) {
        switch type {
        case .cash:
            cashStats.append(CurrencyModel(
                object: currencyName,
                name: LocalizedStringKey(title),
                symbol: symbol,
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
                name: LocalizedStringKey(title),
                symbol: symbol,
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
                name: LocalizedStringKey(title),
                symbol: symbol,
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
                name: LocalizedStringKey(title),
                symbol: symbol,
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
