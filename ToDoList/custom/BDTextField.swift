//
//  BDTextField.swift
//  BroDoList
//
//  Created by Neil Myers on 7/27/18.
//  Copyright © 2018 WatchFoxWare. All rights reserved.
//

import UIKit

class BDTextField:UITextField {
    
    var insets:UIEdgeInsets!
    
    init(frame:CGRect = .zero, placeholder:String = "placeholder", radius:CGFloat = 5, inset:CGFloat = 0) {
        super.init(frame: frame)
        checkIfAutoLayout()
        
        self.placeholder = placeholder
        self.backgroundColor = .white
        self.layer.cornerRadius = radius
        self.insets = UIEdgeInsets(top:0, left: inset, bottom: 0, right: 0)
        self.textColor = .grayZero
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: self.insets)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: self.insets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: self.insets)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
