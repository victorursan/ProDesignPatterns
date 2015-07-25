//
//  Utils.swift
//  SportStore
//
//  Created by Victor Ursan on 7/21/15.
//  Copyright (c) 2015 victorursan. All rights reserved.
//

import Foundation

class Utils {
    class func currencyStringFromNumber(number: Double) -> String {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        return formatter.stringFromNumber(number) ?? ""
    }
    
}