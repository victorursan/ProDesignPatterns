//
//  StockValueFactories.swift
//  SportStore
//
//  Created by Victor Ursan on 8/9/15.
//  Copyright (c) 2015 victorursan. All rights reserved.
//

import Foundation

class StockTotalFactory {
    enum Currency {
        case USD
        case GBP
        case EUR
    }
    
    private(set) var formatter: StockValueFormatter?
    private(set) var converter: StockValueConverter?
    
    class func getFactory(curr: Currency) -> StockTotalFactory {
        if (curr == .USD) {
            return DollarStockTotalFactory.sharedInstance
        } else if (curr == .GBP) {
            return PoundStockTotalFactory.sharedInstance
        } else {
            return EuroHandlerAdapter.sharedInstance
        }
    }
}

private class DollarStockTotalFactory: StockTotalFactory {
    private override init() {
        super.init()
        formatter = DollarStockValueFormatter()
        converter = DollarStockValueConverter()
    }
    
    class var sharedInstance: StockTotalFactory {
        get {
            struct SingletonWrapper {
                static let singleton = DollarStockTotalFactory()
            }
            return SingletonWrapper.singleton
        }
    }
}

private class PoundStockTotalFactory: StockTotalFactory {
    private override init() {
        super.init()
        formatter = PoundStockValueFormatter()
        converter = PoundStockValueConverter()
    }
    
    class var sharedInstance: StockTotalFactory {
        get {
            struct SingletonWrapper {
                static let singleton = PoundStockTotalFactory()
            }
            return SingletonWrapper.singleton
        }
    }
}

private class EuroHandlerAdapter: StockTotalFactory, StockValueConverter, StockValueFormatter {
    private let handler: EuroHandler
    
    private override init () {
        handler = EuroHandler()
        super.init()
        formatter = self
        converter = self
    }
    
    func formatTotal(total: Double) -> String {
        return handler.getDisplaytring(total)
    }
    
    func convertTotal(total: Double) -> Double {
        return handler.getCurrencyAmount(total)
    }
    
    class var sharedInstance: StockTotalFactory {
        get {
            struct SingletonWrapper {
                static let singleton = EuroHandlerAdapter()
            }
            return SingletonWrapper.singleton
        }
    }
}

