//
//  TDButton.swift
//  ToDoList
//
//  Created by Neil Myers on 7/13/18.
//  Copyright © 2018 WatchFoxWare. All rights reserved.
//

import UIKit

class TDButton: UIButton {
    
    var title:String!
    var type:ButtonOptions!
    
    init(title:String = "button text", frame:CGRect = .zero, type:ButtonOptions = .roundedText) {
        super.init(frame: frame)
        if frame == .zero {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        self.title = title
        self.type = type
        self.phaseTwo()
    }
    
    func phaseTwo() {
        self.setTitle(self.title, for: .normal)
        self.setTitleColor(.grayZero, for: .normal)
        self.backgroundColor = .white
        if let titleLabel = self.titleLabel {
            titleLabel.font = UIFont(name: "Raleway-v4020-Regular", size: 16)
        }
        switch self.type {
            case .roundedText:
                self.roundedText()
            case .squareIcon:
                self.squareIcon()
            default: break;
        }

    }
    
    func squareIcon() {
        
    }
    
    func roundedText() {
        self.layer.cornerRadius = 25
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
