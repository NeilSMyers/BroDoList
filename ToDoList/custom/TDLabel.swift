//
//  TDLabel.swift
//  ToDoList
//
//  Created by Neil Myers on 7/6/18.
//  Copyright © 2018 WatchFoxWare. All rights reserved.
//

import UIKit

class TDLabel:UILabel {
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title:String = "default text", color:UIColor = .white, size:CGFloat = 16, frame:CGRect = .zero, textAlign:NSTextAlignment = .left) {
        super.init(frame: frame)
        if frame == .zero {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        self.text = title
        self.textColor = color
        self.font = UIFont.systemFont(ofSize: size)
        self.textAlignment = textAlign
    }
}
