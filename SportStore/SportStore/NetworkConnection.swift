//
//  NetworkConnection.swift
//  SportStore
//
//  Created by Victor Ursan on 7/26/15.
//  Copyright (c) 2015 victorursan. All rights reserved.
//

import Foundation

class NetworkConnection {
    
    private let stockData: [String: Int] = ["Kayak" : 10, "Lifejacket": 14,
        "Soccer Ball": 32," Corner Flags": 1, "Stadium": 4, "Thinking Cap": 8,
        "Unsteady Chair": 3, "Human Chess Board": 2, "Bling-Bling King": 4 ];
    
    func getStockLevel(name: String) -> Int? {
        NSThread.sleepForTimeInterval(Double(rand() % 2))
        return stockData[name]
    }
    
}