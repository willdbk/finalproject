//
//  RocketViewController.swift
//  PhysicsHarryDbk
//
//  Created by Mobile on 5/9/16.
//  Copyright © 2016 com.dbk.coding. All rights reserved.
//

import UIKit

class RocketViewController: UIViewController {

    @IBOutlet weak var mass: UITextField!
    @IBOutlet weak var force: UITextField!
    @IBOutlet weak var time: UITextField!
    @IBOutlet weak var altitude: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateAltitude(sender: UIButton) {
        
    }


}
