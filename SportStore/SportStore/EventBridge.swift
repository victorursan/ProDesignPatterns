//
//  EventBridge.swift
//  SportStore
//
//  Created by Victor Ursan on 8/15/15.
//  Copyright (c) 2015 victorursan. All rights reserved.
//

import Foundation

class EventBridge {
    private let outputCallback: (String, Int) -> Void
    
    init(callback: (String, Int) -> Void) {
        self.outputCallback = callback
    }
    
    var inputCallback:(Product) -> Void {
        return {
            (product: Product) in self.outputCallback(product.name, product.stockLevel)
        }
    }
}