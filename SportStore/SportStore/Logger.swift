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
    
    init(callback:(T) -> ()) {
        self.callback = callback
    }
    
    func logItem(item: T) {
        dataItems.append(item.copy() as! T)
        callback(item)
    }
    
    func procesItems(callback:(T) -> ()) {
        for item in dataItems {
            callback(item)
        }
    }
    
}