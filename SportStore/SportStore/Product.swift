//
//  Product.swift
//  SportStore
//
//  Created by Victor Ursan on 7/21/15.
//  Copyright (c) 2015 victorursan. All rights reserved.
//

import Foundation

class Product {
    
    private(set) var name: String
    private(set) var description: String
    private(set) var category: String
    private(set) var price: Double {
        get { return priceBackingValue}
        set { priceBackingValue = max(1, newValue)}
    }
    
    private var stockLevelBackingValue: Int = 0
    private var priceBackingValue: Double = 0
    
    var stockLevel: Int {
        get { return stockLevelBackingValue}
        set { stockLevelBackingValue = max(0, newValue)}
    }
    var stockValue: Double {
        get { return price * Double(stockLevel)}
    }
    
    init(name: String, description: String, category: String, price: Double, stockLevel: Int) {
        self.name = name
        self.description = description
        self.category = category
        self.price = price
        self.stockLevel = stockLevel
    }
    
}