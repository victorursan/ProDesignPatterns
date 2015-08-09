//
//  StockValueImplementations.swift
//  SportStore
//
//  Created by Victor Ursan on 8/9/15.
//  Copyright (c) 2015 victorursan. All rights reserved.
//

import Foundation

protocol StockValueFormatter {
    func formatTotal(total: Double) -> String
}

class DollarStockValueFormatter: StockValueFormatter {
    func formatTotal(total: Double) -> String {
        let formatted = Utils.currencyStringFromNumber(total)
        return "\(formatted)"
    }
}

class PoundStockValueFormatter: StockValueFormatter {
    func formatTotal(total: Double) -> String {
        let formatted = Utils.currencyStringFromNumber(total)
        return "£\(dropFirst(formatted))"
    }
}

protocol StockValueConverter {
    func convertTotal(total: Double) -> Double
}

class DollarStockValueConverter: StockValueConverter {
    func convertTotal(total: Double) -> Double {
        return total
    }
}

class PoundStockValueConverter: StockValueConverter {
    func convertTotal(total: Double) -> Double {
        return 0.60338 * total
    }
}
