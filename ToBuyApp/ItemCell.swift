//
//  ItemCell.swift
//  ToBuyApp
//
//  Created by Jonathan Compton on 3/20/18.
//  Copyright © 2018 Jonathan Compton. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var contentContainerView: UIView!
    @IBOutlet weak var toBuyImageView: UIImageView!
    @IBOutlet weak var toBuyTitleLabel: UILabel!
    @IBOutlet weak var toBuyPriceLabel: UILabel!
    @IBOutlet weak var toBuyDetailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentContainerView.backgroundColor = UIColor.lightGray
    }

 

}
