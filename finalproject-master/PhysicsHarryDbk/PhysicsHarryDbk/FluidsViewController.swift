//
//  FluidsViewController.swift
//  PhysicsHarryDbk
//
//  Created by Mobile on 5/16/16.
//  Copyright © 2016 com.dbk.coding. All rights reserved.
//

import UIKit

class FluidsViewController: UIViewController {
    
    var fluidsVars: [KinematicVar] = [KinematicVar]()
    
    @IBOutlet weak var density: UITextField!
    @IBOutlet weak var mass: UITextField!
    @IBOutlet weak var volume: UITextField!
    @IBOutlet weak var gravity: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var gauge: UITextField!
    @IBOutlet weak var absolute: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        fluidsVars.append(KinematicVar(n: "p", v: DBL_MAX)) //0
        fluidsVars.append(KinematicVar(n: "m", v: DBL_MAX)) //1
        fluidsVars.append(KinematicVar(n: "v", v: DBL_MAX)) //2
        fluidsVars.append(KinematicVar(n: "g", v: DBL_MAX)) //3
        fluidsVars.append(KinematicVar(n: "h", v: DBL_MAX)) //4
        fluidsVars.append(KinematicVar(n: "gP", v: DBL_MAX)) //5
        fluidsVars.append(KinematicVar(n: "aP", v: DBL_MAX)) //6
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func updateVariables() {
        if(fluidsVars[0].isFilled + fluidsVars[1].isFilled + fluidsVars[2].isFilled == 2) {
            if(fluidsVars[0].isFilled == 1 && fluidsVars[1].isFilled == 1) {
                fluidsVars[2].setValue(fluidsVars[1].value / fluidsVars[0].value)
                volume.text = "\(fluidsVars[2].value)"
            } else if(fluidsVars[1].isFilled == 1 && fluidsVars[2].isFilled == 1) {
                fluidsVars[0].setValue(fluidsVars[1].value / fluidsVars[2].value)
                density.text = "\(fluidsVars[0].value)"
            } else if(fluidsVars[0].isFilled == 1 && fluidsVars[1].isFilled == 1) {
                fluidsVars[1].setValue(fluidsVars[2].value * fluidsVars[0].value)
                mass.text = "\(fluidsVars[1].value)"
            }
        }
        if(fluidsVars[0].isFilled == 1 && fluidsVars[3].isFilled == 1 && fluidsVars[4].isFilled == 1) {
            fluidsVars[5].setValue(fluidsVars[0].value * fluidsVars[3].value * fluidsVars[4].value)
            fluidsVars[6].setValue(fluidsVars[5].value + 101000)
            gauge.text = "\(fluidsVars[5].value)"
            absolute.text = "\(fluidsVars[6].value)"
        } else if(fluidsVars[5].isFilled == 1 && fluidsVars[3].isFilled == 1 && fluidsVars[4].isFilled == 1) {
            fluidsVars[0].setValue(fluidsVars[5].value / fluidsVars[3].value / fluidsVars[4].value)
            density.text = "\(fluidsVars[0].value)"
        } else if(fluidsVars[5].isFilled == 1 && fluidsVars[3].isFilled == 1 && fluidsVars[0].isFilled == 1) {
            fluidsVars[4].setValue(fluidsVars[5].value / fluidsVars[3].value / fluidsVars[0].value)
            height.text = "\(fluidsVars[4].value)"
        } else if(fluidsVars[5].isFilled == 1 && fluidsVars[3].isFilled == 1 && fluidsVars[4].isFilled == 1) {
            fluidsVars[4].setValue(fluidsVars[5].value / fluidsVars[3].value / fluidsVars[4].value)
            gravity.text = "\(fluidsVars[3].value)"
        }


        
    }
    
    @IBAction func pChange(sender: UITextField) {
        if let value = Double(sender.text!) {
            fluidsVars[0].setValue(value)
        }
        else {
            fluidsVars[0].isFilled = 0
        }
        updateVariables()
    }
    
    @IBAction func mChange(sender: UITextField) {
        if let value = Double(sender.text!) {
            fluidsVars[1].setValue(value)
        }
        else {
            fluidsVars[1].isFilled = 0
        }
        updateVariables()
    }
    
    @IBAction func vChange(sender: UITextField) {
        if let value = Double(sender.text!) {
            fluidsVars[2].setValue(value)
        }
        else {
            fluidsVars[2].isFilled = 0
        }
        updateVariables()

    }
    
    @IBAction func clearVars(sender: UIButton) {
        fluidsVars[0].setValue(DBL_MAX)
        density.text = ""
        fluidsVars[1].setValue(DBL_MAX)
        mass.text = ""
        fluidsVars[2].setValue(DBL_MAX)
        volume.text = ""
        fluidsVars[3].setValue(DBL_MAX)
        gravity.text = ""
        fluidsVars[4].setValue(DBL_MAX)
        height.text = ""
        fluidsVars[5].setValue(DBL_MAX)
        gauge.text = ""
        fluidsVars[6].setValue(DBL_MAX)
        absolute.text = ""

    }
    
    @IBAction func gChange(sender: UITextField) {
        if let value = Double(sender.text!) {
            fluidsVars[3].setValue(value)
        }
        else {
            fluidsVars[3].isFilled = 0
        }
        updateVariables()

    }
    
    @IBAction func hChange(sender: UITextField) {
        if let value = Double(sender.text!) {
            fluidsVars[4].setValue(value)
        }
        else {
            fluidsVars[4].isFilled = 0
        }
        updateVariables()

    }
    
    @IBAction func gaugeChange(sender: UITextField) {
        if let value = Double(sender.text!) {
            fluidsVars[5].setValue(value)
        }
        else {
            fluidsVars[5].isFilled = 0
        }
        updateVariables()

    }
    
    @IBAction func aChange(sender: UITextField) {
        if let value = Double(sender.text!) {
            fluidsVars[6].setValue(value)
        }
        else {
            fluidsVars[6].isFilled = 0
        }
        updateVariables()

    }
}
