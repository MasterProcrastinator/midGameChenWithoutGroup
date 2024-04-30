//
//  GameScene.swift
//  midGameChen
//
//  Created by ALVIN CHEN on 3/5/24.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var player: SKSpriteNode!
    var car: SKSpriteNode!
    var car2: SKSpriteNode!
    var car3: SKSpriteNode!
    var car4: SKSpriteNode!
    var car5: SKSpriteNode!
    var car6: SKSpriteNode!
    var car7: SKSpriteNode!
    var car8: SKSpriteNode!
    var pbcar: SKSpriteNode!
    var pgcar: SKSpriteNode!
    var mammoth: SKSpriteNode!
    var whiteFox: SKSpriteNode!
    var snowmobile: SKSpriteNode!
    var iceTrain: SKSpriteNode!
    var test = Vehicle(image: "car", width: 0, height: 0, dx: 0, dy: 0, x: 0)
        var list = [Vehicle]()
    
    let cam = SKCameraNode()
    var gameOver = false
    var winLoseOutlet: SKLabelNode!
    var timeLabel: SKLabelNode!
    var gameTimer = 0
    var timer = Timer()
    var debugTeleport = 0.0
    var farthestDistance = 0

    var invisFollower: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        let backgroundmusic = SKAudioNode(fileNamed: "bensound-goodmood")
        addChild(backgroundmusic)
        startTimer()
        timeLabel = (self.childNode(withName: "timeLabel") as! SKLabelNode)
        timeLabel.fontSize = 30
        winLoseOutlet = (self.childNode(withName: "statusLabel") as! SKLabelNode)
        winLoseOutlet.fontSize = 100
        winLoseOutlet.text = ""
        player = (self.childNode(withName: "player") as! SKSpriteNode)
        invisFollower = (self.childNode(withName: "follower") as! SKSpriteNode)
        self.camera = cam
        self.physicsWorld.contactDelegate = self
        invisFollower.position.x = player.position.x
        invisFollower.position.y = player.position.y
        winLoseOutlet.position.x = player.position.x
        
        
        if ((Int)(player.position.y) > farthestDistance){
            
            farthestDistance = Int(player.position.y)
            
        }
        
        
        
        let count = test.widthList.count
        
        list.append(test)
        var testList = [car, car2, car3 ,car4, car5, car6, car7, car8, pgcar, pbcar, mammoth, whiteFox, snowmobile, iceTrain]
        
        for i in 0...count-1{
            
            enumerateChildNodes(withName: test.imageList[i]) { [self]
                             (node, _) in
                car = node as? SKSpriteNode
                
                testList[i] = node as? SKSpriteNode
                
                testList[i]!.texture = SKTexture(imageNamed: test.imageList[i])
                testList[i]!.size.width = CGFloat(test.widthList[i])
                testList[i]!.size.height = CGFloat(test.heightList[i])
                testList[i]!.physicsBody?.mass = 100000
            }
            
            enumerateChildNodes(withName: "pgcar") { [self]
                             (node, _) in
                pgcar = node as? SKSpriteNode
                
                
                pgcar.physicsBody?.mass = 0.0001
            }
           


            
            
        }

        
        
        
    }
        
    override func update(_ currentTime: TimeInterval) {
        timeLabel.text = "Time: \(gameTimer)"
        timeLabel.position.y = cam.position.y + 550
        timeLabel.position.x = cam.position.x
        cam.position.x = invisFollower.position.x
        cam.position.y = invisFollower.position.y + 300
        winLoseOutlet.position.y = cam.position.y
        
        if (player.position.y >= invisFollower.position.y + 600){
            let moveFollower = SKAction.moveTo(y: player.position.y, duration: 1)
            invisFollower.run(moveFollower)

        }
        
        if (player.position.y <= invisFollower.position.y - 50){
            let moveFollower = SKAction.moveTo(y: player.position.y, duration: 0.3)
            invisFollower.run(moveFollower)
        }
        
        

        let count = test.vImageList.count
               var testList = [car, car2, car3, car4, car5, car6, car7, car8, pgcar, pbcar, mammoth, whiteFox, snowmobile, iceTrain]
               
               for i in 0...count-1{
                   
                   
                   
                   enumerateChildNodes(withName: test.vImageList[i]) { [self]
                                    (node, _) in
                       testList[i] = node as? SKSpriteNode
                       testList[i]!.physicsBody?.velocity.dx = test.dxList[i]
                       testList[i]!.physicsBody?.velocity.dy = test.dyList[i]
                       
                       //add special feature for car6
                       
                       
                       
                       
                       
                       if (test.xList[i] <= 3) {
                           //right
                           if (testList[i]?.position.x)! > (-1 * test.xList[i]){
                               testList[i]?.position.x = (test.xList[i])
                               //cars going right dont work
                               //left negative // right positive
                               
                               
                               
                           }
                       }
                       else if (test.xList[i] > 3){
                           //left
                            if (testList[i]?.position.x)! < (-1 * test.xList[i]){
                              testList[i]?.position.x = (test.xList[i])
                            }
                       }
                       
                       
                       
                       
                       
                       
                   } //end func
                   
                   
                   
               }

        
        
        
        
        
       
      
        
        



        
        
        
    }  //end update
    
    func crash(){
        winLoseOutlet.text = "You Died"
        player.physicsBody?.allowsRotation = true
        player.physicsBody?.friction = 0.5
        player.removeAllActions()
        gameOver = true
        GameOver()
    }

    func didBegin(_ contact: SKPhysicsContact) {
        
        let count = test.imageList.count
             for i in 0...count-1{
                 
             
                 if (contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == test.imageList[i]) || (contact.bodyB.node?.name == "player" && contact.bodyA.node?.name == test.imageList[i]){
                     
                     if (contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == "pgcar") || (contact.bodyB.node?.name == "player" && contact.bodyA.node?.name == "pgcar"){
                         break
                     }
                     
                     else{
                         crash()
                     }
                     
                     
                     //special feature later for car6
                     
                     }
                 
                 
                 
                 
             }

        
        

        
        
        
    }
    
    
    
    
    func startTimer()  {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        gameTimer += 1
    }
    
    //add keys for the movements below
    
        func jumpUp(){
        if gameOver == false{
            if(player.position.y > 6820 && player.position.y < 16000){
                let slowedJumpAction = SKAction.moveBy(x: 0, y: 100, duration: 0.6)
                player.run(slowedJumpAction)
            }
            else{
                let jumpAction = SKAction.moveBy(x: 0, y: 100, duration: 0.3)
                player.run(jumpAction)
            }
        }
    }
    
    func jumpDown(){
        if gameOver == false{
            if(player.position.y > 6820 && player.position.y < 16000){
                let slowedJumpAction = SKAction.moveBy(x: 0, y: -100, duration: 0.6)
                player.run(slowedJumpAction)
            }
            else{
                let jumpAction = SKAction.moveBy(x: 0, y: -100, duration: 0.3)
                player.run(jumpAction)
            }
        }
    }
    
    func jumpLeft(){
        if gameOver == false{
            if(player.position.y > 6820 && player.position.y < 16000){
                let slowedJumpAction = SKAction.moveBy(x: -100, y: 0, duration: 0.35)
                player.run(slowedJumpAction)
            }
            else {
                let jumpAction = SKAction.moveBy(x: -100, y: 0, duration: 0.15)
                player.run(jumpAction)
            }
        }
    }
    
    func jumpRight(){
        if gameOver == false{
            if(player.position.y > 6820 && player.position.y < 16000){
                let slowedJumpAction = SKAction.moveBy(x: 100, y: 0, duration: 0.35)
                player.run(slowedJumpAction)
            }
            else{
                let jumpAction = SKAction.moveBy(x: 100, y: 0, duration: 0.15)
                player.run(jumpAction)
            }
        }
    }
    
    
    
    
    
    func GameOver(){
        player.physicsBody?.velocity.dy = 0

    
    }
    
    func restart(){
        player.physicsBody?.velocity.dx = 0
        player.physicsBody?.velocity.dy = 0
        gameOver = false
        winLoseOutlet.text = ""
        player.physicsBody?.friction = 0
        player.zPosition = 0
        player.zRotation = 0
        player.physicsBody?.allowsRotation = false
        player.position.y = -795.332
        player.position.x = 1.456
        invisFollower.position.y = player.position.y
        player.removeAllActions()
        let rotateAction = SKAction.rotate(toAngle: 0, duration: 0)
        player.run(rotateAction)
        player.physicsBody?.allowsRotation = false
        invisFollower.removeAllActions()
        gameTimer = 0
        
    }
    
    func debugTeleportation(){
        player.physicsBody?.velocity.dx = 0
        player.physicsBody?.velocity.dy = 0
        gameOver = false
        winLoseOutlet.text = ""
        player.physicsBody?.friction = 0
        player.zPosition = 0
        player.zRotation = 0
        player.physicsBody?.allowsRotation = false
        player.position.y = debugTeleport
        player.position.x = 1.456
        invisFollower.position.y = player.position.y
        player.removeAllActions()
        let rotateAction = SKAction.rotate(toAngle: 0, duration: 0)
        player.run(rotateAction)
        invisFollower.removeAllActions()
        gameTimer = 0
    }

    
    
}
