//
//  KinematicsViewController.swift
//  PhysicsHarryDbk
//
//  Created by Mobile on 5/9/16.
//  Copyright © 2016 com.dbk.coding. All rights reserved.
//
import UIKit
import SpriteKit

class KinematicsViewController: UIViewController {

    var kinematicVars: [KinematicVar] = [KinematicVar]()
    
    @IBOutlet weak var dyTF: UITextField!
    @IBOutlet weak var v0yTF: UITextField!
    @IBOutlet weak var vyTF: UITextField!
    @IBOutlet weak var aTF: UITextField!
    @IBOutlet weak var tTF: UITextField!
    @IBOutlet weak var dxTF: UITextField!
    @IBOutlet weak var vxTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        kinematicVars.append(KinematicVar(n: "dy", v: DBL_MAX))
        kinematicVars.append(KinematicVar(n: "v0y", v: DBL_MAX))
        kinematicVars.append(KinematicVar(n: "vy", v: DBL_MAX))
        kinematicVars.append(KinematicVar(n: "a", v: DBL_MAX))
        kinematicVars.append(KinematicVar(n: "t", v: DBL_MAX))
        kinematicVars.append(KinematicVar(n: "dx", v: DBL_MAX))
        kinematicVars.append(KinematicVar(n: "vx", v: DBL_MAX))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setText(input: Double) -> String {
        let output = String(Double(Int(input*1000))/1000)
        return output
    }
    
    func updateVariables() {
        for _ in 0...2 {
            let filledYVariables = kinematicVars[0].isFilled + kinematicVars[1].isFilled + kinematicVars[2].isFilled + kinematicVars[3].isFilled + kinematicVars[4].isFilled
            let filledXVariables = kinematicVars[4].isFilled + kinematicVars[5].isFilled + kinematicVars[6].isFilled
            if(filledYVariables - kinematicVars[0].isFilled == 3) {
                if(kinematicVars[1].isFilled == 0) {
                    kinematicVars[1].setValue(kinematicVars[2].value - (kinematicVars[3].value*kinematicVars[4].value))
                    v0yTF.text = setText(kinematicVars[1].value)
                }
                else if(kinematicVars[2].isFilled == 0) {
                    kinematicVars[2].setValue(kinematicVars[1].value + (kinematicVars[3].value*kinematicVars[4].value))
                    vyTF.text = setText(kinematicVars[2].value)
                }
                else if(kinematicVars[3].isFilled == 0) {
                    kinematicVars[3].setValue((kinematicVars[2].value-kinematicVars[1].value)/kinematicVars[4].value)
                    aTF.text = setText(kinematicVars[3].value)
                    
                }
                else if(kinematicVars[4].isFilled == 0) {
                    kinematicVars[4].setValue((kinematicVars[2].value-kinematicVars[1].value)/kinematicVars[3].value)
                    tTF.text = setText(kinematicVars[4].value)
                }
            }
            else if(filledYVariables - kinematicVars[2].isFilled == 3) {
                if(kinematicVars[0].isFilled == 0) {
                    kinematicVars[0].setValue((kinematicVars[1].value * kinematicVars[4].value) + (kinematicVars[3].value * kinematicVars[4].value * kinematicVars[4].value)/2)
                    dyTF.text = setText(kinematicVars[0].value)
                }
                else if(kinematicVars[1].isFilled == 0) {
                    kinematicVars[1].setValue((kinematicVars[3].value * kinematicVars[4].value)/2 + (kinematicVars[0].value/kinematicVars[4].value))
                    v0yTF.text = setText(kinematicVars[1].value)
                }
                else if(kinematicVars[3].isFilled == 0) {
                    kinematicVars[3].setValue(2*((kinematicVars[0].value/(kinematicVars[4].value*kinematicVars[4].value))) - 2*(kinematicVars[1].value/kinematicVars[4].value))
                    aTF.text = setText(kinematicVars[3].value)
                }
                else if(kinematicVars[4].isFilled == 0) {
                    kinematicVars[4].setValue((-1*(kinematicVars[1].value) + sqrt(kinematicVars[1].value + 2*(kinematicVars[3].value*kinematicVars[0].value)))/(kinematicVars[3].value))
                    tTF.text = setText(kinematicVars[4].value)
                }
            }
            else if(filledYVariables - kinematicVars[3].isFilled == 3) {
                if(kinematicVars[0].isFilled == 0) {
                    kinematicVars[0].setValue((kinematicVars[1].value+kinematicVars[2].value)*kinematicVars[4].value/2)
                    dyTF.text = setText(kinematicVars[1].value)
                }
                else if(kinematicVars[1].isFilled == 0) {
                    kinematicVars[1].setValue((2 * kinematicVars[0].value / kinematicVars[4].value) - kinematicVars[2].value)
                    v0yTF.text = setText(kinematicVars[1].value)
                }
                else if(kinematicVars[2].isFilled == 0) {
                    kinematicVars[2].setValue((2 * kinematicVars[0].value / kinematicVars[4].value) - kinematicVars[1].value)
                    vyTF.text = setText(kinematicVars[2].value)
                    
                }
                else if(kinematicVars[4].isFilled == 0) {
                    kinematicVars[4].setValue((2 * kinematicVars[0].value)/(kinematicVars[1].value + kinematicVars[2].value))
                    tTF.text = setText(kinematicVars[4].value)
                }
            }
            
            
            else if(filledYVariables - kinematicVars[4].isFilled == 3) {
                if(kinematicVars[0].isFilled == 0) {
                    kinematicVars[0].setValue((pow(kinematicVars[2].value, 2) - pow(kinematicVars[1].value, 2))/(2 * kinematicVars[3].value))
                    dyTF.text = setText(kinematicVars[0].value)
                }
                else if(kinematicVars[1].isFilled == 0) {
                    kinematicVars[1].setValue(sqrt((2 * kinematicVars[3].value * kinematicVars[0].value) - pow(kinematicVars[2].value, 2)))
                    v0yTF.text = setText(kinematicVars[1].value)
                }
                else if(kinematicVars[2].isFilled == 0) {
                    kinematicVars[2].setValue(sqrt((2 * kinematicVars[3].value * kinematicVars[0].value) - pow(kinematicVars[1].value, 2)))
                    vyTF.text = setText(kinematicVars[2].value)
                }
                else if(kinematicVars[3].isFilled == 0) {
                    kinematicVars[3].setValue((pow(kinematicVars[2].value, 2) - pow(kinematicVars[1].value, 2))/(2 * kinematicVars[0].value))
                    aTF.text = setText(kinematicVars[3].value)
                }
            }
            if(filledXVariables == 2) {
                if(kinematicVars[4].isFilled == 0) {
                    kinematicVars[4].setValue((kinematicVars[5].value)/(kinematicVars[6].value))
                    tTF.text = setText(kinematicVars[4].value)
                }
                else if(kinematicVars[5].isFilled == 0) {
                    kinematicVars[5].setValue((kinematicVars[6].value)*(kinematicVars[4].value))
                    dxTF.text = setText(kinematicVars[5].value)
                }
                else if(kinematicVars[6].isFilled == 0) {
                    kinematicVars[6].setValue((kinematicVars[5].value)/(kinematicVars[4].value))
                    vxTF.text = setText(kinematicVars[6].value)
                }
            }
        }
        print(kinematicVars[0].isFilled)
        print(kinematicVars[1].isFilled)
        print(kinematicVars[2].isFilled)
        print(kinematicVars[3].isFilled)
        print(kinematicVars[4].isFilled)
        print(kinematicVars[5].isFilled)
        print(kinematicVars[6].isFilled)
        print(kinematicVars[0].value)
        print(kinematicVars[1].value)
        print(kinematicVars[2].value)
        print(kinematicVars[3].value)
        print(kinematicVars[4].value)
        print(kinematicVars[5].value)
        print(kinematicVars[6].value)
    }
    
    @IBAction func dyChanged(sender: UITextField) {
        if let value = Double(sender.text!) {
            kinematicVars[0].setValue(value)
        }
        else {
            kinematicVars[0].isFilled = 0
        }
        updateVariables()
    }

    @IBAction func v0yChanged(sender: UITextField) {
        if let value = Double(sender.text!) {
            kinematicVars[1].setValue(value)
        }
        else {
            kinematicVars[1].isFilled = 0
        }
        updateVariables()
    }

    @IBAction func vyChanged(sender: UITextField) {
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
    
    @IBAction func dxChanged(sender: UITextField) {
        if let value = Double(sender.text!) {
            kinematicVars[5].setValue(value)
        }
        else {
            kinematicVars[5].isFilled = 0
        }
        updateVariables()
    }
    
    @IBAction func vxChanged(sender: UITextField) {
        if let value = Double(sender.text!) {
            kinematicVars[6].setValue(value)
        }
        else {
            kinematicVars[6].isFilled = 0
        }
        updateVariables()
    }
    
    
    @IBAction func clear(sender: UIButton) {
        resetVariables()
    }
    
    func resetVariables() {
        print("work")
        kinematicVars[0].setValue(DBL_MAX)
        dyTF.text = ""
        kinematicVars[1].setValue(DBL_MAX)
        v0yTF.text = ""
        kinematicVars[2].setValue(DBL_MAX)
        vyTF.text = ""
        kinematicVars[3].setValue(DBL_MAX)
        aTF.text = ""
        kinematicVars[4].setValue(DBL_MAX)
        tTF.text = ""
        kinematicVars[5].setValue(DBL_MAX)
        dxTF.text = ""
        kinematicVars[6].setValue(DBL_MAX)
        vxTF.text = ""
    }
    
   /* @IBAction func simulatePhysics(sender: UIButton) {
        
    }*/
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
