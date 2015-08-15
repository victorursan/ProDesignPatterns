//
//  Euro.swift
//  SportStore
//
//  Created by Victor Ursan on 8/15/15.
//  Copyright (c) 2015 victorursan. All rights reserved.
//

import Foundation

class EuroHandler {
    func getDisplaytring(amount: Double) -> String {
        let formater = Utils.currencyStringFromNumber(amount)
        return "€\(dropFirst(formater))"
    }
    
    func getCurrencyAmount(amount: Double) -> Double {
        return amount * 0.76164
    }
}