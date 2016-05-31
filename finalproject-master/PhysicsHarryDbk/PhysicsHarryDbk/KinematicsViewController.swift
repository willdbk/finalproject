//
//  KinematicsViewController.swift
//  PhysicsHarryDbk
//
//  Created by Mobile on 5/9/16.
//  Copyright © 2016 com.dbk.coding. All rights reserved.
//

import UIKit

class KinematicsViewController: UIViewController {

    var kinematicVars: [KinematicVar] = [KinematicVar]()
    
    @IBOutlet weak var dTF: UITextField!
    @IBOutlet weak var v0TF: UITextField!
    @IBOutlet weak var vTF: UITextField!
    @IBOutlet weak var aTF: UITextField!
    @IBOutlet weak var tTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        kinematicVars.append(KinematicVar(n: "d", v: DBL_MAX))  //0
        kinematicVars.append(KinematicVar(n: "v0", v: DBL_MAX)) //2
        kinematicVars.append(KinematicVar(n: "v", v: DBL_MAX))  //3
        kinematicVars.append(KinematicVar(n: "a", v: DBL_MAX))  //4
        kinematicVars.append(KinematicVar(n: "t", v: DBL_MAX))  //5
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateVariables() {
        for _ in 0...1 {
            let filledVariables = kinematicVars[0].isFilled + kinematicVars[1].isFilled + kinematicVars[2].isFilled + kinematicVars[3].isFilled + kinematicVars[4].isFilled
            if(filledVariables - kinematicVars[0].isFilled == 3) {
                if(kinematicVars[1].isFilled == 0) {
                    kinematicVars[1].setValue(kinematicVars[2].value - (kinematicVars[3].value*kinematicVars[4].value))
                    v0TF.text = String(kinematicVars[1].value)
                }
                else if(kinematicVars[2].isFilled == 0) {
                    kinematicVars[2].setValue(kinematicVars[1].value + (kinematicVars[3].value*kinematicVars[4].value))
                    vTF.text = String(kinematicVars[2].value)
                }
                else if(kinematicVars[3].isFilled == 0) {
                    kinematicVars[3].setValue((kinematicVars[2].value-kinematicVars[1].value)/kinematicVars[4].value)
                    aTF.text = String(kinematicVars[3].value)
                    
                }
                else if(kinematicVars[4].isFilled == 0) {
                    kinematicVars[4].setValue((kinematicVars[2].value-kinematicVars[1].value)/kinematicVars[3].value)
                    tTF.text = String(kinematicVars[4].value)
                }
            }
            else if(filledVariables - kinematicVars[2].isFilled == 3) {
                if(kinematicVars[0].isFilled == 0) {
                    kinematicVars[0].setValue((kinematicVars[1].value * kinematicVars[4].value) + (kinematicVars[3].value * kinematicVars[4].value * kinematicVars[4].value)/2)
                    dTF.text = String(kinematicVars[0].value)
                }
                else if(kinematicVars[1].isFilled == 0) {
                    kinematicVars[1].setValue((kinematicVars[3].value * kinematicVars[4].value)/2 + (kinematicVars[0].value/kinematicVars[4].value))
                    v0TF.text = String(kinematicVars[1].value)
                }
                else if(kinematicVars[3].isFilled == 0) {
                    kinematicVars[3].setValue(2*((kinematicVars[0].value/(kinematicVars[4].value*kinematicVars[4].value))) - 2*(kinematicVars[1].value/kinematicVars[4].value))
                    aTF.text = String(kinematicVars[3].value)
                }
                else if(kinematicVars[4].isFilled == 0) {
                    kinematicVars[4].setValue((-1*(kinematicVars[1].value) + sqrt(kinematicVars[1].value + 2*(kinematicVars[3].value*kinematicVars[0].value)))/(kinematicVars[3].value))
                    tTF.text = String(kinematicVars[4].value)
                }
            }
            else if(filledVariables - kinematicVars[3].isFilled == 3) {
                if(kinematicVars[0].isFilled == 0) {
                    kinematicVars[0].setValue((kinematicVars[1].value+kinematicVars[2].value)*kinematicVars[4].value/2)
                    dTF.text = String(kinematicVars[1].value)
                }
                else if(kinematicVars[1].isFilled == 0) {
                    kinematicVars[1].setValue((2 * kinematicVars[0].value / kinematicVars[4].value) - kinematicVars[2].value)
                    v0TF.text = String(kinematicVars[1].value)
                }
                else if(kinematicVars[2].isFilled == 0) {
                    kinematicVars[2].setValue((2 * kinematicVars[0].value / kinematicVars[4].value) - kinematicVars[1].value)
                    vTF.text = String(kinematicVars[2].value)
                    
                }
                else if(kinematicVars[4].isFilled == 0) {
                    kinematicVars[4].setValue((2 * kinematicVars[0].value)/(kinematicVars[1].value + kinematicVars[2].value))
                    tTF.text = String(kinematicVars[4].value)
                }
            }
            
            
            else if(filledVariables - kinematicVars[4].isFilled == 3) {
                if(kinematicVars[0].isFilled == 0) {
                    kinematicVars[0].setValue((pow(kinematicVars[2].value, 2) - pow(kinematicVars[1].value, 2))/(2 * kinematicVars[3].value))
                    dTF.text = String(kinematicVars[0].value)
                }
                else if(kinematicVars[1].isFilled == 0) {
                    kinematicVars[1].setValue(sqrt((2 * kinematicVars[3].value * kinematicVars[0].value) - pow(kinematicVars[2].value, 2)))
                    v0TF.text = String(kinematicVars[1].value)
                }
                else if(kinematicVars[2].isFilled == 0) {
                    kinematicVars[2].setValue(sqrt((2 * kinematicVars[3].value * kinematicVars[0].value) - pow(kinematicVars[1].value, 2)))
                    vTF.text = String(kinematicVars[2].value)
                }
                else if(kinematicVars[3].isFilled == 0) {
                    kinematicVars[3].setValue((pow(kinematicVars[2].value, 2) - pow(kinematicVars[1].value, 2))/(2 * kinematicVars[0].value))
                    aTF.text = String(kinematicVars[3].value)
                }
            }
        }
        print(kinematicVars[0].isFilled)
        print(kinematicVars[1].isFilled)
        print(kinematicVars[2].isFilled)
        print(kinematicVars[3].isFilled)
        print(kinematicVars[4].isFilled)
        print(kinematicVars[0].value)
        print(kinematicVars[1].value)
        print(kinematicVars[2].value)
        print(kinematicVars[3].value)
        print(kinematicVars[4].value)
    }
    
    @IBAction func dChanged(sender: UITextField) {
        if let value = Double(sender.text!) {
            kinematicVars[0].setValue(value)
        }
        else {
            kinematicVars[0].isFilled = 0
        }
        updateVariables()
    }

    @IBAction func v0Changed(sender: UITextField) {
        if let value = Double(sender.text!) {
            kinematicVars[1].setValue(value)
        }
        else {
            kinematicVars[1].isFilled = 0
        }
        updateVariables()
    }

    @IBAction func vChanged(sender: UITextField) {
        if let value = Double(sender.text!) {
            kinematicVars[2].setValue(value)
        }
        else {
            kinematicVars[2].isFilled = 0
        }
        updateVariables()
    }

    @IBAction func aChanged(sender: UITextField) {
        if let value = Double(sender.text!) {
            kinematicVars[3].setValue(value)
        }
        else {
            kinematicVars[3].isFilled = 0
        }
        updateVariables()
    }
    
    @IBAction func tChanged(sender: UITextField) {
        if let value = Double(sender.text!) {
            kinematicVars[4].setValue(value)
        }
        else {
            kinematicVars[4].isFilled = 0
        }
        updateVariables()
    }
    
    @IBAction func clear(sender: UIButton) {
        resetVariables()
    }
    
    func resetVariables() {
        kinematicVars[0].setValue(DBL_MAX)
        dTF.text = ""
        kinematicVars[1].setValue(DBL_MAX)
        v0TF.text = ""
        kinematicVars[2].setValue(DBL_MAX)
        vTF.text = ""
        kinematicVars[3].setValue(DBL_MAX)
        aTF.text = ""
        kinematicVars[4].setValue(DBL_MAX)
        tTF.text = ""
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
