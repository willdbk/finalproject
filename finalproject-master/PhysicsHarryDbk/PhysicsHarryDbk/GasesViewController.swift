//
//  GasesViewController.swift
//  PhysicsHarryDbk
//
//  Created by Mobile on 5/24/16.
//  Copyright © 2016 com.dbk.coding. All rights reserved.
//

import UIKit

class GasesViewController: UIViewController {
    var gasesVars: [KinematicVar] = [KinematicVar]()
    
    var b = 0.0000000000000000000000138
    var r = 8.31
    
    @IBOutlet weak var pressure: UITextField!
    @IBOutlet weak var volume: UITextField!
    @IBOutlet weak var moles: UITextField!
    @IBOutlet weak var molecules: UITextField!
    @IBOutlet weak var temperature: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        gasesVars.append(KinematicVar(n: "p", v: DBL_MAX)) //0
        gasesVars.append(KinematicVar(n: "v", v: DBL_MAX)) //1
        gasesVars.append(KinematicVar(n: "mol", v: DBL_MAX)) //2
        gasesVars.append(KinematicVar(n: "mlc", v: DBL_MAX)) //3
        gasesVars.append(KinematicVar(n: "tmp", v: DBL_MAX)) //3

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func updateVariables() {
        if(gasesVars[0].isFilled + gasesVars[1].isFilled + gasesVars[4].isFilled == 3) {
            gasesVars[2].setValue(gasesVars[0].value * gasesVars[1].value / gasesVars[4].value / r)
            gasesVars[3].setValue(gasesVars[0].value * gasesVars[1].value / gasesVars[4].value / b)
            moles.text = "\(gasesVars[2].value)"
            molecules.text = "\(gasesVars[3].value)"
        }
        if(gasesVars[0].isFilled == 1 && gasesVars[1].isFilled == 1 && gasesVars[2].isFilled == 1) {
            gasesVars[4].setValue(gasesVars[0].value * gasesVars[1].value / gasesVars[2].value / r)
            temperature.text = "\(gasesVars[4].value)"
        }
        if(gasesVars[0].isFilled == 1 && gasesVars[1].isFilled == 1 && gasesVars[3].isFilled == 1) {
            gasesVars[4].setValue(gasesVars[0].value * gasesVars[1].value / gasesVars[3].value / b)
            temperature.text = "\(gasesVars[4].value)"
        }
        if(gasesVars[0].isFilled == 1 && gasesVars[2].isFilled == 1 && gasesVars[4].isFilled == 1) {
            gasesVars[1].setValue(gasesVars[2].value * gasesVars[4].value * r / gasesVars[0].value)
            volume.text = "\(gasesVars[1].value)"
        }
        if(gasesVars[0].isFilled == 1 && gasesVars[3].isFilled == 1 && gasesVars[4].isFilled == 1) {
            gasesVars[1].setValue(gasesVars[3].value * gasesVars[4].value * b / gasesVars[0].value)
            volume.text = "\(gasesVars[1].value)"
        }
        if(gasesVars[1].isFilled == 1 && gasesVars[2].isFilled == 1 && gasesVars[4].isFilled == 1) {
            gasesVars[0].setValue(gasesVars[2].value * gasesVars[4].value * r / gasesVars[1].value)
            pressure.text = "\(gasesVars[0].value)"
        }
        if(gasesVars[1].isFilled == 1 && gasesVars[3].isFilled == 1 && gasesVars[4].isFilled == 1) {
            gasesVars[0].setValue(gasesVars[3].value * gasesVars[4].value * b / gasesVars[1].value)
            pressure.text = "\(gasesVars[0].value)"
        }





        
        
    }
    
    @IBAction func pChange(sender: UITextField) {
        if let value = Double(sender.text!) {
            gasesVars[0].setValue(value)
        }
        else {
            gasesVars[0].isFilled = 0
        }
        updateVariables()
    }
    
    @IBAction func vChange(sender: UITextField) {
        if let value = Double(sender.text!) {
            gasesVars[1].setValue(value)
        }
        else {
            gasesVars[1].isFilled = 0
        }
        updateVariables()
    }
    
    @IBAction func molChange(sender: UITextField) {
        if let value = Double(sender.text!) {
            gasesVars[2].setValue(value)
        }
        else {
            gasesVars[2].isFilled = 0
        }
        updateVariables()
        
    }
    
    @IBAction func clearVars(sender: UIButton) {
        gasesVars[0].setValue(DBL_MAX)
        pressure.text = ""
        gasesVars[1].setValue(DBL_MAX)
        volume.text = ""
        gasesVars[2].setValue(DBL_MAX)
        moles.text = ""
        gasesVars[3].setValue(DBL_MAX)
        molecules.text = ""
        gasesVars[4].setValue(DBL_MAX)
        temperature.text = ""
 
    }
    
    @IBAction func mlcChange(sender: UITextField) {
        if let value = Double(sender.text!) {
            gasesVars[3].setValue(value)
        }
        else {
            gasesVars[3].isFilled = 0
        }
        updateVariables()
        
    }
    
    @IBAction func tmpChange(sender: UITextField) {
        if let value = Double(sender.text!) {
            gasesVars[4].setValue(value)
        }
        else {
            gasesVars[4].isFilled = 0
        }
        updateVariables()
        
    }
    

}
