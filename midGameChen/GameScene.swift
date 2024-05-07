//
//  GameScene.swift
//  midGameChen
//
//  Created by ALVIN CHEN on 3/5/24.
//

import SpriteKit
import GameplayKit
import AVFoundation


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
    var pbear: SKSpriteNode!
    var pgcar: SKSpriteNode!
    var mammoth: SKSpriteNode!
    var whiteFox: SKSpriteNode!
    var snowmobile: SKSpriteNode!
    var iceTrain: SKSpriteNode!
    var armadillo: SKSpriteNode!
    var spider: SKSpriteNode!
    var camel: SKSpriteNode!
    var scorpion: SKSpriteNode!
    var tortoise: SKSpriteNode!
    var desertScourge: SKSpriteNode!
    var sandShark: SKSpriteNode!
    var spider2: SKSpriteNode!
    var meteor: SKSpriteNode!
    var meteor2: SKSpriteNode!
    var meteor3: SKSpriteNode!
    var meteor4: SKSpriteNode!
    
    var lastCheckpoint = -800
    var checkpoint1 = -800
    var checkpoint2 = 2730
    var checkpoint3 = 8850
    var checkpoint4 = 12800
    var checkpoint5 = 16100
    var checkpoint6 = 17450
    var checkpoint7 = 18700
    
    
    
    
    
    
    
    
    
    var test = Vehicle(image: "car", width: 0, height: 0, dx: 0, dy: 0, x: 0)
    var deathsounds = [SKAudioNode(fileNamed: "death1"),SKAudioNode(fileNamed: "death2"),SKAudioNode(fileNamed: "death3"),SKAudioNode(fileNamed: "death4"),SKAudioNode(fileNamed: "death5"),SKAudioNode(fileNamed: "death6"),SKAudioNode(fileNamed: "death7"),SKAudioNode(fileNamed: "death8")
    ]
    
    
    
    
    var list = [Vehicle(image: "car", width: 80, height: 60, dx: -350, dy: 0, x: 480),
                Vehicle(image: "car2", width: 60, height: 60, dx: 350, dy: 0, x: -480),
                Vehicle(image: "car3", width: 141, height: 90, dx: 400, dy: 0, x: -480),
                Vehicle(image: "car4", width: 175, height: 100, dx: 450, dy: 0, x: -480),
                Vehicle(image: "car5", width: 114, height: 60, dx: -500, dy: 0, x: 480),
                Vehicle(image: "car6", width: 80, height: 60, dx: 1000, dy: 0, x: -480),
                Vehicle(image: "car7", width: 305, height: 185, dx: -800, dy: 0, x: 900),
                Vehicle(image: "car8", width: 1000, height: 127, dx: 100, dy: 0, x: -1000),
                Vehicle(image: "penguin", width: 60, height: 60, dx: 50, dy: 0, x: -480),
                Vehicle(image: "pbear", width: 300, height: 100, dx: 50, dy: 0, x: -480),
                Vehicle(image: "whiteFox", width: 160, height: 50, dx: -300, dy: 0, x: 480),
                Vehicle(image: "snowmobile", width: 175, height: 100, dx: 400, dy: 0, x: -480),
                Vehicle(image: "iceTrain", width: 2000, height: 150, dx: -50, dy: 0, x: 750),
                Vehicle(image: "mammoth", width: 730, height: 475, dx: 90, dy: 0, x: -700),
                Vehicle(image: "armadillo", width: 80, height: 75, dx: 200, dy: 0, x: -400),
                Vehicle(image: "camel", width: 110, height: 90, dx: -200, dy: 0, x: 400),
                Vehicle(image: "scorpion", width: 80, height: 65, dx: -170, dy: 0, x: 400),
                Vehicle(image: "tortoise", width: 90, height: 75, dx: 170, dy: 0, x: -400),
                Vehicle(image: "spider", width: 80, height: 70, dx: 150, dy: 0, x: -400),
                Vehicle(image: "desertScourge", width: 400, height: 80, dx: -300, dy: 0, x: 400),
                Vehicle(image: "sandShark", width: 200, height: 80, dx: -250, dy: 0, x: 400),
                Vehicle(image: "spider2", width: 80, height: 70, dx: -200, dy: 0, x: 400)

                
    ]
    
    
    
    
    
    
    
    
    let cam = SKCameraNode()
    var gameOver = false
    var winLoseOutlet: SKLabelNode!
    var timeLabel: SKLabelNode!
    var gameTimer = 0
    var timer = Timer()
    var debugTeleport = 0.0
    var farthestDistance = 0
    var lives = 5
    var invisFollower: SKSpriteNode!
    var livesLabel: SKLabelNode!

    
    override func didMove(to view: SKView) {
        //        let backgroundmusic = SKAudioNode(fileNamed: "bensound-goodmood")
        //        addChild(backgroundmusic)
        startTimer()
        timeLabel = (self.childNode(withName: "timeLabel") as! SKLabelNode)
        livesLabel = (self.childNode(withName: "livesLabel") as! SKLabelNode)
        lives = 5
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
        
        
        let backgroundmusic = SKAudioNode(fileNamed: "bensound-goodmood")
        addChild(backgroundmusic)
        
        let count = list.count
        
        
        
        
        var testList = [car, car2, car3 ,car4, car5, car6, car7, car8, pgcar, pbear, mammoth, whiteFox, snowmobile, iceTrain, tortoise, spider, desertScourge, sandShark, spider2, scorpion, armadillo, sandShark]
        
        
        
        for i in 0...count-1{
            
            enumerateChildNodes(withName: list[i].image) { [self]
                (node, _) in
                car = node as? SKSpriteNode
                
                testList[i] = node as? SKSpriteNode
                
                testList[i]!.texture = SKTexture(imageNamed: list[i].image)
                testList[i]!.size.width = CGFloat(list[i].width)
                testList[i]!.size.height = CGFloat(list[i].height)
                testList[i]!.physicsBody?.mass = 100000
            }
            
            
            
        }
        
        enumerateChildNodes(withName: "pgcar") { [self]
            (node, _) in
            pgcar = node as? SKSpriteNode
            
            
            pgcar.physicsBody?.mass = 0.0001
        }
        
        //meteors go downward
        
        enumerateChildNodes(withName: "meteor") { [self]
            (node, _) in
            meteor = node as? SKSpriteNode

            meteor = node as? SKSpriteNode
            meteor.texture = SKTexture(imageNamed: "meteor")
            //meteor.size.width =
            //meteor.size.height =
            meteor.physicsBody?.mass = 200
        }
        enumerateChildNodes(withName: "meteor2") { [self]
            (node, _) in
            meteor2 = node as? SKSpriteNode

            meteor2 = node as? SKSpriteNode
            meteor2.texture = SKTexture(imageNamed: "meteor2")
            //meteor.size.width =
            //meteor.size.height =
            meteor2.physicsBody?.mass = 200
        }
        enumerateChildNodes(withName: "meteor3") { [self]
            (node, _) in
            meteor = node as? SKSpriteNode

            meteor3 = node as? SKSpriteNode
            meteor3.texture = SKTexture(imageNamed: "meteor3")
            //meteor.size.width =
            //meteor.size.height =
            meteor3.physicsBody?.mass = 200
        }
        enumerateChildNodes(withName: "meteor4") { [self]
            (node, _) in
            meteor4 = node as? SKSpriteNode

            meteor4 = node as? SKSpriteNode
            meteor4.texture = SKTexture(imageNamed: "meteor4")
            //meteor.size.width =
            //meteor4.size.height =
            meteor4.physicsBody?.mass = 200
        }
        
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        //checkpoint code
        if player.position.y < CGFloat(checkpoint2){
            lastCheckpoint = checkpoint1
        }
        else if (player.position.y >= CGFloat(checkpoint2) && player.position.y < CGFloat(checkpoint3)){
            lastCheckpoint = checkpoint2
        }
        else if (player.position.y >= CGFloat(checkpoint3) && player.position.y < CGFloat(checkpoint4)){
            lastCheckpoint = checkpoint3
        }
        else if (player.position.y >= CGFloat(checkpoint4) && player.position.y < CGFloat(checkpoint5)){
            lastCheckpoint = checkpoint4
        }
        else if (player.position.y >= CGFloat(checkpoint5) && player.position.y < CGFloat(checkpoint6)){
            lastCheckpoint = checkpoint5
        }
        else if (player.position.y >= CGFloat(checkpoint6) && player.position.y < CGFloat(checkpoint7)){
            lastCheckpoint = checkpoint6
        }
        
        //continue once done with space
        
        
        
        
        
        
        
        
        
        timeLabel.text = "Time: \(gameTimer)"
        timeLabel.position.y = cam.position.y + 550
        timeLabel.position.x = cam.position.x
        livesLabel.text = "Lives: \(lives)"
        livesLabel.position.y = cam.position.y + 450
        livesLabel.position.x = cam.position.x
        cam.position.x = invisFollower.position.x
        cam.position.y = invisFollower.position.y + 300
        winLoseOutlet.position.y = cam.position.y
        
        if (player.position.y >= 31000 && player.position.y <= 31900){
            player.physicsBody?.velocity.dx = 0
            player.physicsBody?.velocity.dy = 0
            player.physicsBody?.friction = 0
            player.position.x = 0
            player.position.y = 34000
            invisFollower.position.y = player.position.y
            player.removeAllActions()
            invisFollower.removeAllActions()
        }
        
        if (player.position.y >= invisFollower.position.y + 600){
            let moveFollower = SKAction.moveTo(y: player.position.y, duration: 1)
            invisFollower.run(moveFollower)
            
        }
        
        if (player.position.y <= invisFollower.position.y - 50){
            let moveFollower = SKAction.moveTo(y: player.position.y, duration: 0.3)
            invisFollower.run(moveFollower)
        }
        
        
        
        let count = list.count
        
        
        
        
        var testList = [car, car2, car3 ,car4, car5, car6, car7, car8, pgcar, pbear, mammoth, whiteFox, snowmobile, iceTrain, tortoise, spider, desertScourge, sandShark, spider2, scorpion, armadillo, sandShark]
        
        for i in 0...count-1{
            
            
            
            enumerateChildNodes(withName: list[i].image) { [self]
                (node, _) in
                testList[i] = node as? SKSpriteNode
                testList[i]!.physicsBody?.velocity.dx = CGFloat(list[i].dx)
                testList[i]!.physicsBody?.velocity.dy = CGFloat(list[i].dy)
                
                //add special feature for car6
                
                
                
                
                
                if (list[i].x <= 1) {
                    //right
                    if (Int(((testList[i]?.position.x)!)) > -1 * list[i].x){
                        testList[i]?.position.x = CGFloat((list[i].x))
                        //cars going right dont work
                        //left negative // right positive
                        
                        
                        
                    }
                }
                else if (list[i].x > 1){
                    //left
                    if (Int((testList[i]?.position.x)!) < -1 * list[i].x){
                        testList[i]?.position.x = CGFloat(list[i].x)
                    }
                }
                
                
                
                
                
                
            } //end func
            
            
            
        }
        
        
        
        
        enumerateChildNodes(withName: "meteor") { [self]
                         (node, _) in
            meteor = node as? SKSpriteNode
            meteor.physicsBody?.velocity.dx = 0
            //meteor.physicsBody?.velocity.dy = -350
            
            if (meteor.position.x < -370 || meteor.position.x > 370 || meteor.position.y < 22000){
                let randomInt = Int.random(in: -300...300)
                meteor.position.y = 32000
                meteor.position.x = CGFloat(randomInt)
                

            }

        }
        
        enumerateChildNodes(withName: "meteor2") { [self]
                         (node, _) in
            meteor2 = node as? SKSpriteNode
            meteor2.physicsBody?.velocity.dx = 0
            //meteor.physicsBody?.velocity.dy = -350
            
            if (meteor2.position.x < -370 || meteor2.position.x > 370 || meteor2.position.y < 22000){
                let randomInt = Int.random(in: -300...300)
                meteor2.position.y = 32000
                meteor2.position.x = CGFloat(randomInt)
                

            }

        }
        
        enumerateChildNodes(withName: "meteor3") { [self]
                         (node, _) in
            meteor3 = node as? SKSpriteNode
            meteor3.physicsBody?.velocity.dx = 0
            //meteor.physicsBody?.velocity.dy = -350
            
            if (meteor3.position.x < -370 || meteor3.position.x > 370 || meteor3.position.y < 22000){
                let randomInt = Int.random(in: -300...300)
                meteor3.position.y = 32000
                meteor3.position.x = CGFloat(randomInt)
                

            }

        }
        
        enumerateChildNodes(withName: "meteor4") { [self]
                         (node, _) in
            meteor4 = node as? SKSpriteNode
            meteor4.physicsBody?.velocity.dx = 0
            //meteor.physicsBody?.velocity.dy = -350
            
            if (meteor4.position.x < -370 || meteor4.position.x > 370 || meteor4.position.y < 22000){
                let randomInt = Int.random(in: -300...300)
                meteor4.position.y = 32000
                meteor4.position.x = CGFloat(randomInt)
                

            }

        }
        
        
        
        
        
        
        
        
        
        
    }  //end update
    
    func crash(){
        deathaffect()
        winLoseOutlet.text = "You Died"
        player.physicsBody?.allowsRotation = true
        player.physicsBody?.friction = 0.5
        player.removeAllActions()
        gameOver = true
        GameOver()
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        let count = list.count
        for i in 0...count-1{
            
            
            if (contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == list[i].image) || (contact.bodyB.node?.name == "player" && contact.bodyA.node?.name == list[i].image){
                
                if (contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == "pgcar") || (contact.bodyB.node?.name == "player" && contact.bodyA.node?.name == "pgcar"){
                    break
                }
                    
                    else if(lives > 0){
                        lives-=1
                        teleportLastCheckpoint()
                        print("should have tped")
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
        fjump()
        if gameOver == false{
            if(player.position.y > 6820 && player.position.y < 16000){
                let slowedJumpAction = SKAction.moveBy(x: 0, y: 100, duration: 0.6)
                player.run(slowedJumpAction)
            }
            else if(player.position.y >= 16000 && player.position.y < 19000){
                let fastJumpAction = SKAction.moveBy(x: 0, y: 100, duration: 0.15)
                player.run(fastJumpAction)
            }
            else if(player.position.y >= 20800 && player.position.y < 31000){
                let spaceJumpAction = SKAction.moveBy(x: 0, y: 300, duration: 0.9)
                player.run(spaceJumpAction)
            }
            else{
                let jumpAction = SKAction.moveBy(x: 0, y: 100, duration: 0.3)
                player.run(jumpAction)
            }
        }
    }
    
    func jumpDown(){
        fjump()
        if gameOver == false{
            if(player.position.y > 6820 && player.position.y < 16000){
                let slowedJumpAction = SKAction.moveBy(x: 0, y: -100, duration: 0.6)
                player.run(slowedJumpAction)
            }
            else if(player.position.y >= 16000 && player.position.y < 19000){
                let fastJumpAction = SKAction.moveBy(x: 0, y: -100, duration: 0.15)
                player.run(fastJumpAction)
            }
            else if(player.position.y >= 20800 && player.position.y < 31000){
                let spaceJumpAction = SKAction.moveBy(x: 0, y: -300, duration: 0.9)
                player.run(spaceJumpAction)
            }
            else{
                let jumpAction = SKAction.moveBy(x: 0, y: -100, duration: 0.3)
                player.run(jumpAction)
            }
        }
    }
    
    func jumpLeft(){
        sjump()
        if gameOver == false{
            if(player.position.y > 6820 && player.position.y < 16000){
                let slowedJumpAction = SKAction.moveBy(x: -100, y: 0, duration: 0.35)
                player.run(slowedJumpAction)
            }
            else if(player.position.y >= 16000 && player.position.y < 19000){
                let fastJumpAction = SKAction.moveBy(x: -100, y: 0, duration: 0.075)
                player.run(fastJumpAction)
            }
            else if(player.position.y >= 20800 && player.position.y < 31000){
                let spaceJumpAction = SKAction.moveBy(x: -300, y: 0, duration: 0.45)
                player.run(spaceJumpAction)
            }
            else {
                let jumpAction = SKAction.moveBy(x: -100, y: 0, duration: 0.15)
                player.run(jumpAction)
            }
        }
    }
    
    func jumpRight(){
//        let sidejump = SKAudioNode(fileNamed: "sidejump")
//        addChild(sidejump)
        sjump()
        if gameOver == false{
            if(player.position.y > 6820 && player.position.y < 16000){
                let slowedJumpAction = SKAction.moveBy(x: 100, y: 0, duration: 0.35)
                player.run(slowedJumpAction)
            }
            else if(player.position.y >= 16000 && player.position.y < 19000){
                    let fastJumpAction = SKAction.moveBy(x: 100, y: 0, duration: 0.075)
                    player.run(fastJumpAction)
            }
            else if(player.position.y >= 20800 && player.position.y < 31000){
                let spaceJumpAction = SKAction.moveBy(x: 300, y: 0, duration: 0.45)
                player.run(spaceJumpAction)
            }
            else{
                let jumpAction = SKAction.moveBy(x: 100, y: 0, duration: 0.15)
                player.run(jumpAction)
            }
        }
        
    }
    
    
    
    func GameOver(){
        player.physicsBody?.velocity.dy = 0
        player.physicsBody?.velocity.dx = 0
        
        
    }
    
    func restart(){
        player.physicsBody?.velocity.dx = 0
        player.physicsBody?.velocity.dy = 0
        gameOver = false
        winLoseOutlet.text = ""
        player.physicsBody?.friction = 0
        player.zPosition = 1
        player.zRotation = 0
        player.physicsBody?.allowsRotation = false
        player.position.y = -800
        player.position.x = 0
        invisFollower.position.y = player.position.y
        player.removeAllActions()
        let rotateAction = SKAction.rotate(toAngle: 0, duration: 0)
        player.run(rotateAction)
        player.physicsBody?.allowsRotation = false
        invisFollower.removeAllActions()
        gameTimer = 0
        lives = 10
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
        player.position.x = 0
        invisFollower.position.y = player.position.y
        player.removeAllActions()
        let rotateAction = SKAction.rotate(toAngle: 0, duration: 0)
        player.run(rotateAction)
        invisFollower.removeAllActions()
        gameTimer = 0
    }
    func sjump(){
//        let sjump = SKAudioNode(fileNamed: "sidejump")
//        addChild(sjump)
        player.run(SKAction.playSoundFileNamed("sidejump",waitForCompletion:false));

    }
    func fjump(){
//        let fjump = SKAudioNode(fileNamed: "fowardjump")
//        addChild(fjump)
        
        player.run(SKAction.playSoundFileNamed("fowardjump",waitForCompletion:false));
        
    }
    func deathaffect(){
        let randomInt = Int.random(in: 0..<7)
        player.run(SKAction.playSoundFileNamed("\(deathsounds[randomInt])",waitForCompletion:false));

    }
    
    func teleportLastCheckpoint(){
        player.physicsBody?.velocity.dx = 0
        player.physicsBody?.velocity.dy = 0
        player.physicsBody?.friction = 0
        player.zPosition = 1
        //player.position.y = (CGFloat)(lastCheckpoint)
        player.removeAllActions()
        let tpBack = SKAction.moveTo(y: (CGFloat)(lastCheckpoint), duration: 0)
        player.run(tpBack)
        player.position.x = 0
        invisFollower.position.y = player.position.y

        invisFollower.removeAllActions()
        
    }
    
    
    
    
    
    
    
}
