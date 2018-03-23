//
//  item.swift
//  ToBuyApp
//
//  Created by Jonathan Compton on 3/20/18.
//  Copyright © 2018 Jonathan Compton. All rights reserved.
//

import Foundation
import AVFoundation
import AVKit

class Item {
    var title: String
    var price: String
    var image: UIImage
    var details: String
    
    init(title: String, price: String, image: UIImage, details: String) {
        self.title = title
        self.price = price
        self.image = image
        self.details = details
    }
}
