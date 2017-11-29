//
//  SecondViewController.swift
//  TodoList
//
//  Created by Alexander Alegre on 11/28/17.
//  Copyright © 2017 Alexander Alegre. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var itemTextField: UITextField!
    
    @IBAction func addItemButtonTap(_ sender: UIButton) {
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        var items:  [String]
        
        if let tempItems = itemsObject as? [String] {
            items = tempItems
            items.append(itemTextField.text!)
//            items.addObjects(from: [itemTextField.text!])
        } else {
            items = [itemTextField.text!]
        }
        
        UserDefaults.standard.set(items, forKey: "items")
        // empty the text field after save
        itemTextField.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

