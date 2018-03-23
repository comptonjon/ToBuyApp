//
//  AddEditVC.swift
//  ToBuyApp
//
//  Created by Jonathan Compton on 3/20/18.
//  Copyright © 2018 Jonathan Compton. All rights reserved.
//

import UIKit
import AVKit
class AddEditVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    let db = ItemDB.singletonDB
    let imagePicker = UIImagePickerController()
    var editMode = false
    var index : Int? = nil

    
    
    @IBOutlet weak var itemTitleTextField: UITextField!
    @IBOutlet weak var itemPriceTextField: UITextField!
    @IBOutlet weak var itemDetailTextField: UITextField!
    @IBOutlet weak var addEditButton: UIButton!
    @IBOutlet weak var navItem: UINavigationItem!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var changePhotoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if editMode {
            addEditButton.setTitle("Edit Item", for: .normal)
            self.itemTitleTextField.placeholder = db.items[index!].title
            self.itemPriceTextField.placeholder = db.items[index!].price
            self.itemDetailTextField.placeholder = db.items[index!].details
            self.itemImage.image = db.items[index!].image
            navItem.title = "Edit Item"
            
        } else {
            navItem.title = "Add Item"
            self.itemImage.image = UIImage(named: "default.jpg")
            changePhotoButton.setTitle("Add Photo", for: .normal)
            
        }
        imagePicker.delegate = self
        
       
        

        
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.itemImage.image = image
            if editMode {
                self.db.items[index!].image = image
            }
            
            imagePicker.dismiss(animated: true, completion: nil)
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func addEditButtonTapped(_ sender: Any) {
        if editMode {
            if let index = index {
                self.editItem(index: index)
            }
        } else {
            let newItem = Item(title: itemTitleTextField.text!, price: itemPriceTextField.text!, image: itemImage.image!, details: itemDetailTextField.text!)
            db.items.append(newItem)
        }
        
        navigationController!.popViewController(animated: true)
    }
        
        
    @IBAction func changePhotoBtnTapped(_ sender: UIButton) {
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
    }
    

    

}
