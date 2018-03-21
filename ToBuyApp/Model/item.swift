//
//  item.swift
//  ToBuyApp
//
//  Created by Jonathan Compton on 3/20/18.
//  Copyright © 2018 Jonathan Compton. All rights reserved.
//

import Foundation

class Item {
    var title: String
    var price: String
    var image: String
    var details: String
    
    init(title: String, price: String, image: String, details: String) {
        self.title = title
        self.price = price
        self.image = image
        self.details = details
    }
}
