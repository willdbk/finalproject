//
//  FluidsViewController.swift
//  PhysicsHarryDbk
//
//  Created by Mobile on 5/16/16.
//  Copyright © 2016 com.dbk.coding. All rights reserved.
//

import UIKit

class FluidsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }

}
