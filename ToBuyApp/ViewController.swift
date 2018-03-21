//
//  ViewController.swift
//  ToBuyApp
//
//  Created by Jonathan Compton on 3/20/18.
//  Copyright © 2018 Jonathan Compton. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.darkGray
        tableView.delegate = self
        tableView.dataSource = self

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.toBuyImageView.image = UIImage(named: "img01.jpg")
        cell.toBuyTitleLabel.text = "Seattle Supersonics"
        cell.toBuyPriceLabel.text = "$700,000,000.00"
        cell.toBuyDetailLabel.text = "Rich history and several stars have emerged historically from this now defunct franchise."
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }

}

