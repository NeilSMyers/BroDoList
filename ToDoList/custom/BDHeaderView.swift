//
//  TDHeader.swift
//  ToDoList
//
//  Created by Neil Myers on 7/14/18.
//  Copyright © 2018 WatchFoxWare. All rights reserved.
//

import UIKit

class BDHeaderView:UIView {
    
    let bg = BDGradient()
    let titleLabel = BDLabel(size: 14)
    let subTitleLabel = BDLabel(size: 24)
    let addButton = BDButton(title: "+", type: .squareIcon)
    var delegate:BDHeaderDelegate?
    
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
        
        addSubview(addButton)
        addButton.bottomAnchor.constraint(equalTo: subTitleLabel.bottomAnchor).isActive = true
        addButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -28).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor, multiplier: 1).isActive = true
        
        addButton.addTarget(self, action: #selector(self.handleAddButton), for: .touchUpInside)
    }
    
    @objc func handleAddButton() {
        if let delegate = self.delegate {
            delegate.addItem()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
