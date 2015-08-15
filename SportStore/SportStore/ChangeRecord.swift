//
//  ChangeRecord.swift
//  SportStore
//
//  Created by Victor Ursan on 8/15/15.
//  Copyright (c) 2015 victorursan. All rights reserved.
//

import Foundation

class ChangeRecord: Printable {
    private let outerTag: String
    private let productName: String
    private let catName: String
    private let innerTag: String
    private let value: String
    
    private init(outer: String, name: String, category: String, inner: String, value: String) {
        self.outerTag = outer
        self.productName = name
        self.catName = category
        self.innerTag = inner
        self.value = value
    }
    
    var description: String {
        get {
            return "<\(outerTag)> <\(innerTag) name =\"\(productName)\" category =\"\(catName)\">" +
            "\(value) </\(innerTag)> </\(outerTag)>"
        }
    }
}

class ChangeRecordBuilder {
    var outerTag: String
    var innerTag: String
    var productName: String?
    var category: String?
    var value: String?
    
    init() {
        outerTag = "change"
        innerTag = "product"
    }
    
    var changeRecord: ChangeRecord? {
        get {
            if let productName = productName, category = category, value = value {
                return ChangeRecord(outer: outerTag, name: productName, category: category, inner: innerTag, value: value)
            } else {
                return nil
            }
        }
    }
}