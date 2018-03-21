//
//  AddEditVC.swift
//  ToBuyApp
//
//  Created by Jonathan Compton on 3/20/18.
//  Copyright © 2018 Jonathan Compton. All rights reserved.
//

import UIKit

class AddEditVC: UIViewController {
    
    let db = ItemDB.singletonDB
    let editMode = false
    let indexPath : IndexPath? = nil
    let item : Item? = nil
    
    
    @IBOutlet weak var itemTitleTextField: UITextField!
    @IBOutlet weak var itemPriceTextField: UITextField!
    @IBOutlet weak var itemDetailTextField: UITextField!
    @IBOutlet weak var addEditButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if editMode {
            addEditButton.setTitle("Edit Item", for: .normal)
        }
        
       
        

        
    }

    
    @IBAction func addEditButtonTapped(_ sender: Any) {
        let newItem = Item(title: itemTitleTextField.text!, price: itemPriceTextField.text!, image: "default.jpg", details: itemDetailTextField.text!)
        db.items.append(newItem)
        navigationController!.popViewController(animated: true)
    }
    

    

}
