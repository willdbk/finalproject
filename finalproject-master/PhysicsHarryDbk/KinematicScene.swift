//
//  KinematicScene.swift
//  PhysicsHarryDbk
//
//  Created by Mobile on 5/19/16.
//  Copyright © 2016 com.dbk.coding. All rights reserved.
//

import SpriteKit

class KinematicScene: SKScene {
    
    var rocket: SKSpriteNode!
    
    override func didMoveToView(view: SKView) {
        let bottomEdge = SKSpriteNode()
        bottomEdge.physicsBody = SKPhysicsBody(edgeFromPoint: CGPointMake(0, 1), toPoint: CGPointMake((self.view?.frame.size.width)!, 1))
        self.addChild(bottomEdge)
        self.physicsWorld.gravity = CGVectorMake(0, 0)
        
        rocket = SKSpriteNode(imageNamed: "rocket.png")
        let physicsBody: SKPhysicsBody = SKPhysicsBody(texture: rocket.texture!, size: rocket.texture!.size())
        physicsBody.dynamic = true
        rocket.physicsBody = physicsBody
        rocket.setScale(0.2)
        rocket.zRotation = 0
        rocket.position = CGPoint(x: (self.view?.bounds.width)!/2, y: (self.view?.bounds.height)!/2)
        self.addChild(rocket)
        let flames = SKEmitterNode(fileNamed: "FireParticleEmitter")!
        flames.zRotation = CGFloat(M_PI)
        flames.position = CGPointMake(rocket.anchorPoint.x, rocket.anchorPoint.y - rocket.texture!.size().height*4/9)
        flames.xScale = 0.4
        flames.yScale = 1.5
        rocket.addChild(flames)
        
        //let parentViewController = self.view?.window?.rootViewController?.parentViewController as! KinematicsViewController
        //let kinematicVars = parentViewController.kinematicVars
        /*var posX = CGFloat(0)
        var posY = CGFloat(0)
        if(4 < 0) {
            posX = (self.view?.bounds.size.width)!
        }
        if(20.4 < 0) {
            posY = (self.view?.bounds.size.height)!
        }
        rocket.position = CGPointMake(posX, posY)*/
        rocket.physicsBody?.velocity = (CGVectorMake(CGFloat(20), CGFloat(10)))
        rocket.physicsBody!.applyForce(CGVectorMake(0, CGFloat(-9.8)))
        let wait = SKAction.waitForDuration(5)
        self.runAction(wait, completion: { physicsBody.dynamic = false
            self.physicsWorld.gravity = CGVectorMake(0, 0) } )
    }
}
