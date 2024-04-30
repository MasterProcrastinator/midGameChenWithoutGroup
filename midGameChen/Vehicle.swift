//
//  Vehicle.swift
//  midGameChen
//
//  Created by OLIVER MURRAY on 4/19/24.
//


import Foundation
public class Vehicle{
    var image : String = ""
    var width: Int
    var height: Int
    var mass = 10000
    
    var dx: Int
    var dy: Int
    var x: Int
    
    let  imageList = ["car", "car2", "car3", "car4", "car5", "car6", "car7", "car8", "pgcar", "pbcar","mammoth", "whiteFox", "snowmobile", "iceTrain"]
    let  widthList = [80, 60, 141, 175, 114, 80, 305, 800, 95, 265, 730, 160, 175, 2000]
    let  heightList = [60, 60, 90, 100, 60, 60, 185, 127, 100, 218, 475, 50, 100, 150]

    
    
    
    
    
    let dxList: [CGFloat] = [-350, 350, 400, 450, -500, 1000, -800, 300, 50, 400, 90, -300, 400, -50]
    let dyList: [CGFloat] = [0, 0, 0 , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    var xList: [CGFloat] = [480, -480, -480, -480, 480, -480, 480, -1000, -480, -480, -700, 480, -480, 2000]
    let vImageList = ["car", "car2", "car3", "car4", "car5", "car6", "car7", "car8", "pgcar", "pbcar", "mammoth", "whiteFox", "snowmobile", "iceTrain"]

    
    
    public init(image: String, width: Int, height: Int, mass: Int = 10000, dx: Int, dy: Int, x: Int) {
        self.image = image
        self.width = width
        self.height = height
        self.mass = mass
        self.dx = dx
        self.dy = dy
        self.x = x
    }
    }
