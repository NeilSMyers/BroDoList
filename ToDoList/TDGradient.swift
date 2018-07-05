//
//  TDGradient.swift
//  ToDoList
//
//  Created by Neil Myers on 7/5/18.
//  Copyright © 2018 WatchFoxWare. All rights reserved.
//

import UIKit

class TDGradient:UIView {
    
    var colors:[CGColor] = [
        UIColor.init(red: 100, green: 228, blue: 255).cgColor,
        UIColor.init(red: 58, green: 123, blue: 213).cgColor
    ]
    
    var hexColors:[CGColor] = [
        UIColor.init(rgb: 0x64e4ff).cgColor,
        UIColor.init(rgb: 0x3a7bd5).cgColor
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        if let layer = self.layer as? CAGradientLayer {
            layer.colors = self.hexColors
            layer.locations = [0.0, 1.2]
        }
        
        
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
