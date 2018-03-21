//
//  ViewController.swift
//  ToBuyApp
//
//  Created by Jonathan Compton on 3/20/18.
//  Copyright © 2018 Jonathan Compton. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let database = ItemDB.singletonDB
    var item : Item? = nil
    var index : Int? = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.darkGray
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        let item = database.items[indexPath.row]
        cell.itemImageView.image = UIImage(named: item.image)
        cell.itemTitleLabel.text = item.title
        cell.itemPriceLabel.text = item.price
        cell.itemDetailLabel.text = item.details
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(longTap(recognizer:)))
        cell.addGestureRecognizer(longGesture)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return database.items.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        item = database.items[indexPath.row]
        index = indexPath.row
        performSegue(withIdentifier: "toAddEditVCEdit", sender: self)
            
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddEditVCEdit" {
            let destinationVC = segue.destination as! AddEditVC
            destinationVC.editMode = true
            destinationVC.index = self.index
        }
    }
    
    @objc func longTap(recognizer: UILongPressGestureRecognizer){
        let longPress =  recognizer as UILongPressGestureRecognizer
        _ = longPress.state
        let locationInView = longPress.location(in: tableView)
        let indexPath = tableView.indexPathForRow(at: locationInView)
        let alert = UIAlertController(title: "Delete This Item?", message: "", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes", style: .destructive, handler: { (action) in
            self.database.items.remove(at: indexPath!.row)
            self.tableView.deleteRows(at: [indexPath!], with: .fade)
        })
        let noAction = UIAlertAction(title: "No", style: .cancel, handler: { (action) in
            return
        })
        alert.addAction(yesAction)
        alert.addAction(noAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    
    

}

