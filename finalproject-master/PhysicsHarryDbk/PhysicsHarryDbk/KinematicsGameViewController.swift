//
//  KinematicsGameViewController.swift
//  PhysicsHarryDbk
//
//  Created by Mobile on 5/25/16.
//  Copyright © 2016 com.dbk.coding. All rights reserved.
//

import UIKit
import SpriteKit

class KinematicsGameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = KinematicScene(size: self.view.frame.size)            // Configure the view.
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .AspectFill
        
        skView.presentScene(scene)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
