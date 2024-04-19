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
    
    let  imageList = ["car", "car2", "car3", "car4", "car5", "car6", "car7", "car8"]
    let  widthList = [80, 60, 141, 175, 114, 80, 305, 800]
    let  heightList = [60, 60, 90, 100, 60, 60, 185, 127]
    
    
    
    
    let dxList: [CGFloat] = [-350, -500, -800, 350, 400, 450, 1000, 300]
    let dyList: [CGFloat] = [0, 0, 0, 0, 0, 0, 0, 0]
    var xList: [CGFloat] = [480, 480, 900, -480, -480, -480, -480, -1000]
    let vImageList = ["car", "car5", "car7", "car2", "car3", "car4", "car6", "car8"]
    
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
