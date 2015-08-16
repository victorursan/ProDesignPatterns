//
//  ProductDecorators.swift
//  SportStore
//
//  Created by Victor Ursan on 8/16/15.
//  Copyright (c) 2015 victorursan. All rights reserved.
//

import Foundation

class PriceDecorator: Product {
    private let wrappedProduct: Product
    
    required init(name: String, description: String, category: String, price: Double, stockLevel: Int) {
         fatalError("Not Supported")
    }
    
    init(product: Product) {
        wrappedProduct = product
        super.init(name: product.name, description: product.productDescription,
            category: product.category, price: product.price,
            stockLevel: product.stockLevel)
    }
}

class LowStockIncreaseDecorator: PriceDecorator {
    override var price: Double {
        var price = wrappedProduct.price
        if (stockLevel <= 4) {
            price = price * 1.5
        }
        return price
    }
}

class DecreaseSoccerDecorator: PriceDecorator {
    override var price: Double {
        return wrappedProduct.price * 0.5
    }
}