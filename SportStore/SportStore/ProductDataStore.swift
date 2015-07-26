//
//  ProductDataStore.swift
//  SportStore
//
//  Created by Victor Ursan on 7/26/15.
//  Copyright (c) 2015 victorursan. All rights reserved.
//

import Foundation

final class ProductDataStore {
    var callback: ((Product) -> ())?
    private var networkQ: dispatch_queue_t
    private var uiQ: dispatch_queue_t
    lazy var products: [Product] = self.loadData()
    
    init() {
        networkQ = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)
        uiQ = dispatch_get_main_queue()
    }
    
    private func loadData() -> [Product]{
        productData.map{(product: Product) -> () in
            dispatch_async(self.networkQ){
                let stockConn = NetworkPool.getConnection()
                if let level = stockConn.getStockLevel(product.name) {
                    product.stockLevel = level
                    dispatch_async(self.uiQ) {
                        if let callback = self.callback {
                            callback(product)
                        }
                    }
                }
                NetworkPool.returnConnecton(stockConn)
            }
        }
        return productData
    }
    
    private var productData: [Product] = [
        Product(name: "Kayak", description: "A boat for one person", category: "Watersports", price: 275.0, stockLevel: 10),
        Product(name: "Lifejacket", description: "Protective and fashionable", category: "Watersports", price: 48.95, stockLevel: 14),
        Product(name: "Soccer Ball", description: "FIFA-approved size and weight", category: "Soccer", price: 19.5, stockLevel: 32),
        Product(name: "Corner Flags", description: "Give your playing field a professional touch", category: "Soccer", price: 34.95, stockLevel: 1),
        Product(name: "Stadium", description: "Flat-packed 35,000-seat stadium", category: "Soccer", price: 79500.0, stockLevel: 4),
        Product(name: "Thinking Cap", description: "Improve your brain efficiency by 75%", category: "Chess", price: 16.0, stockLevel: 8),
        Product(name: "Unsteady Chair", description: "Secretly give your opponent a disadvantage", category: "Chess", price: 29.95, stockLevel: 3),
        Product(name: "Human Chess Board", description: "A fun game for the family", category: "Chess", price: 75.0, stockLevel: 2),
        Product(name: "Bling-Bling King", description: "Gold-plated, diamond-studded King", category: "Chess", price: 1200.0, stockLevel: 4)];
    
    
}