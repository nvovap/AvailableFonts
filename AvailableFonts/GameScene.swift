//
//  GameScene.swift
//  AvailableFonts
//
//  Created by nvovap on 1/21/16.
//  Copyright (c) 2016 nvovap. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var familyIdx: Int = 0
    
    override init(size: CGSize) {
        super.init(size: size)
        showCurrentFamily()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func showCurrentFamily() {
        
        removeAllChildren()
        
        let familyName = UIFont.familyNames()[familyIdx]
        print("Family: \(familyIdx)")
        
        let fontNames = UIFont.fontNamesForFamilyName(familyName)
        
        for (idx, fontName) in fontNames.enumerate() {
            let label = SKLabelNode(fontNamed: fontName)
            label.text = fontName
            label.position = CGPoint(x: size.width/2, y: (size.height * (CGFloat(idx+1))) / (CGFloat(fontNames.count+1)))
            label.fontSize = 50
            label.verticalAlignmentMode = .Center
            addChild(label)
        }
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        familyIdx++
        if familyIdx >= UIFont.familyNames().count {
            familyIdx = 0
        }
        showCurrentFamily()
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
