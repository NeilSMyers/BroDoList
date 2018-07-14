//
//  TDHeader.swift
//  ToDoList
//
//  Created by Neil Myers on 7/14/18.
//  Copyright © 2018 WatchFoxWare. All rights reserved.
//

import UIKit

class TDHeaderView:UIView {
    
    let bg = TDGradient()
    let titleLabel = TDLabel(size: 14)
    let subTitleLabel = TDLabel(size: 24)
    
    init(frame: CGRect = .zero, title:String = "header title", subtitle:String = "header subtitle") {
        super.init(frame: frame)
        if frame == .zero {
            translatesAutoresizingMaskIntoConstraints = false
        }
        self.titleLabel.text = title
        self.subTitleLabel.text = subtitle
        setupLayout()
    }
    
    func setupLayout() {
        addSubview(bg)
        bg.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        bg.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 12).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 28).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        subTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 28).isActive = true
        subTitleLabel.rightAnchor.constraint(equalTo: centerXAnchor, constant: 50).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}