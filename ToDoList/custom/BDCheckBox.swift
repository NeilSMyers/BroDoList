//
//  BDCheckBox.swift
//  BroDoList
//
//  Created by Neil Myers on 8/23/18.
//  Copyright © 2018 WatchFoxWare. All rights reserved.
//

import UIKit

class GDCheckBox:UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.grayZero.cgColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
