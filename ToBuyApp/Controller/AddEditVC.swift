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
    var editMode = false
    var index : Int? = nil

    
    
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
    func editItem(index: Int) {
        if itemTitleTextField.text! != "" {
            db.items[index].title = itemTitleTextField.text!
        }
        if itemPriceTextField.text != "" {
            db.items[index].price  = itemPriceTextField.text!
        }
        if itemDetailTextField.text != "" {
            db.items[index].details = itemDetailTextField.text!
        }
        print("Edited")
    }

    
    @IBAction func addEditButtonTapped(_ sender: Any) {
        if editMode {
            if let index = index {
                self.editItem(index: index)
            }
        } else {
            let newItem = Item(title: itemTitleTextField.text!, price: itemPriceTextField.text!, image: "default.jpg", details: itemDetailTextField.text!)
            db.items.append(newItem)
        }
        
        navigationController!.popViewController(animated: true)
    }
        
        
    

    

}
