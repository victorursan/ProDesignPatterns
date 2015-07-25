//
//  Logger.swift
//  SportStore
//
//  Created by Victor Ursan on 7/25/15.
//  Copyright (c) 2015 victorursan. All rights reserved.
//

import Foundation

class Logger<T where T:NSObject, T:NSCopying> {
    var dataItems:[T] = []
    var callback:(T) -> ()
    var arrayQ = dispatch_queue_create("arrayQ", DISPATCH_QUEUE_CONCURRENT)
    
    init(callback:(T) -> ()) {
        self.callback = callback
    }
    
    func logItem(item: T) {
        dispatch_sync(arrayQ) {
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