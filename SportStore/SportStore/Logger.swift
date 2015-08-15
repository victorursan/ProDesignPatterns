//
//  Logger.swift
//  SportStore
//
//  Created by Victor Ursan on 7/25/15.
//  Copyright (c) 2015 victorursan. All rights reserved.
//

import Foundation

let productLogger = Logger<Product>(callback: {
    (product: Product) in
    var builder = ChangeRecordBuilder()
    builder.productName = product.name
    builder.category = product.category
    builder.value = String(product.stockLevel)
    builder.outerTag = "stockChange"
    
    if let changeRecord = builder.changeRecord {
        println(changeRecord)
    }
})

final class Logger<T where T:NSObject, T:NSCopying> {
    var dataItems:[T] = []
    var callback:(T) -> ()
    var arrayQ = dispatch_queue_create("arrayQ", DISPATCH_QUEUE_CONCURRENT)
    var callbackQ = dispatch_queue_create("callbackQ", DISPATCH_QUEUE_SERIAL)
    
    private init(callback:(T) -> (), protected: Bool = true) {
        self.callback = callback
        if (protected) {
            self.callback = {(item: T) in
                dispatch_sync(self.callbackQ) {
                    callback(item)
                }
            }
        }
    }
    
    func logItem(item: T) {
        dispatch_barrier_async(arrayQ) {
            self.dataItems.append(item.copy() as! T)
            self.callback(item)
        }
    }
    
    func procesItems(callback:(T) -> ()) {
        dispatch_sync(arrayQ) {
            for item in self.dataItems {
                callback(item)
            }
        }
    }
    
}