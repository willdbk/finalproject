//
//  WavesViewController.swift
//  PhysicsHarryDbk
//
//  Created by Mobile on 5/31/16.
//  Copyright © 2016 com.dbk.coding. All rights reserved.
//

import Foundation
import UIKit

class WavesViewController: UIViewController {
    var wavesVars: [KinematicVar] = [KinematicVar]()
    
    var b = 0.0000000000000000000000138
    var r = 8.31
    
    @IBOutlet weak var wavelength: UITextField!
    @IBOutlet weak var velocity: UITextField!
    @IBOutlet weak var frequency: UITextField!
    @IBOutlet weak var indexOfRefraction: UITextField!
    @IBOutlet weak var temperature: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        wavesVars.append(KinematicVar(n: "p", v: DBL_MAX)) //0
        wavesVars.append(KinematicVar(n: "v", v: DBL_MAX)) //1
        wavesVars.append(KinematicVar(n: "mol", v: DBL_MAX)) //2
        wavesVars.append(KinematicVar(n: "mlc", v: DBL_MAX)) //3
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
}
