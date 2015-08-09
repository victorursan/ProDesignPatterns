//
//  Product.swift
//  SportStore
//
//  Created by Victor Ursan on 7/21/15.
//  Copyright (c) 2015 victorursan. All rights reserved.
//

import Foundation

class Product: NSObject, NSCopying{
    
    private(set) var name: String
    private(set) var productDescription: String
    private(set) var category: String
    private(set) var price: Double {
        get { return priceBackingValue}
        set { priceBackingValue = max(1, newValue)}
    }
    
    private var stockLevelBackingValue: Int = 0
    private var priceBackingValue: Double = 0
    private var salesTaxRate: Double = 0.2
    
    var stockLevel: Int {
        get { return stockLevelBackingValue}
        set { stockLevelBackingValue = max(0, newValue)}
    }
    
    var stockValue: Double {
        get { return (price * (1 + salesTaxRate)) * Double(stockLevel) }
    }
    
    required init(name: String, description: String, category: String, price: Double, stockLevel: Int) {
        self.name = name
        self.productDescription = description
        self.category = category
        
        super.init()
        
        self.price = price
        self.stockLevel = stockLevel
    }
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        return Product(name: name, description: productDescription, category: category, price: price, stockLevel: stockLevel)
    }
    
    var upsells: [UpsellOpportunities] {
        get {
            return Array()
        }
    }
    
    class func createProduct(name: String, description: String, category: String, price: Double, stockLevel: Int) -> Product {
        var productType: Product.Type
        switch (category) {
        case "Watersports":
            productType = WatersportsProduct.self
        case "Soccer":
            productType = SoccerProduct.self
        default:
            productType = Product.self
        }
        return productType(name: name, description: description, category: category, price: price, stockLevel: stockLevel)
    }
}

enum UpsellOpportunities {
    case SwimmingLessons
    case MapOfLakes
    case SoccerVideos
}

class WatersportsProduct: Product {
    required init(name: String, description: String, category: String, price: Double, stockLevel: Int) {
        super.init(name: name, description: description, category: category, price: price, stockLevel: stockLevel)
        salesTaxRate = 0.1;
    }
    
    override var upsells: [UpsellOpportunities] {
        return [.SwimmingLessons, .MapOfLakes]
    }
}

class SoccerProduct: Product {
    required init(name: String, description: String, category: String, price: Double, stockLevel: Int) {
        super.init(name: name, description: description, category: category, price: price, stockLevel: stockLevel)
        salesTaxRate = 0.25;
    }
    
    override var upsells: [UpsellOpportunities] {
        return [.SoccerVideos]
    }
}


