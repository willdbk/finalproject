//
//  KinematicVar.swift
//  PhysicsHarryDbk
//
//  Created by Mobile on 5/10/16.
//  Copyright © 2016 com.dbk.coding. All rights reserved.
//

import Foundation

class KinematicVar {
    var name: String!
    var value: Double!
    var isFilled: Int!
    
    init(n: String, v: Double) {
        name = n
        value = v
        checkIfFilled()
    }
    
    func checkIfFilled() {
        if(value == DBL_MAX) {
            isFilled = 0
        }
        else {
            isFilled = 1
        }
    }
    
    func setValue(v: Double) {
        value = v
        checkIfFilled()
    }
}