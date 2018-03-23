//
//  itemDB.swift
//  ToBuyApp
//
//  Created by Jonathan Compton on 3/20/18.
//  Copyright © 2018 Jonathan Compton. All rights reserved.
//

import Foundation
import AVKit

class ItemDB {
    var items = [Item]()
    
    static let singletonDB = ItemDB()
    
    init(){
        loadData()
    }
    
    
    func loadData(){
        let item1 = Item(title: "Vans Black on Black", price: "$60.00", image: UIImage(named: "vans.jpg")!, details: "Low profile sneakers for all occasions.")
        let item2 = Item(title: "Chesterfield Sofa", price: "1800.00", image: UIImage(named:"sofa.jpg")!, details: "Classic look with modern updates and materials.  Seats three comfortably.")
        let item3 = Item(title: "Gibson Les Paul Vintage", price: "$2299.99", image: UIImage(named:"gibson.jpg")!, details: "Rosewood neck and dual humbucker pickups in Rock and Roll Black")
        let item4 = Item(title: "65 inch 4K HDTV", price: "$1199.99", image: UIImage(named:"tv.jpg")!, details: "Giant TV with exceptional color and clarity great for movies, football, and video gaming.")
        let item5 = Item(title: "10x10 Oriental Rug", price: "$1800.00", image: UIImage(named:"rug.jpg")!, details: "Handmade with top-quality wool from Morocco.")
        let item6 =  Item(title: "Seattle Supersonics", price: "$700,000,000.00", image: UIImage(named:"img01.jpg")!, details: "Rich history and several stars have emerged historically from this now defunct franchise.")
        items.append(item1)
        items.append(item2)
        items.append(item3)
        items.append(item4)
        items.append(item5)
        items.append(item6)
    }
    
}
