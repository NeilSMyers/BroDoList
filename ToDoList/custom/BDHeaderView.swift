//
//  BDHeader.swift
//  BroDoList
//
//  Created by Neil Myers on 7/14/18.
//  Copyright © 2018 WatchFoxWare. All rights reserved.
//

import UIKit

class BDHeaderView:UIView {
    
    let bg = BDGradient()
    let titleLabel = BDLabel(size: 14)
    let subtitleLabel = BDLabel(size: 24)
    let addButton = BDButton(type: .squareIcon)
    let menuButton = BDButton(title: "menu", type: .roundedText, radius: 5)
    var delegate:BDHeaderDelegate?
    
    @objc func handleMenu() {
        print("you clicked the menu button")
    }
    
    init(frame: CGRect = .zero, title:String = "header title", subtitle:String = "header subtitle") {
        super.init(frame: frame)
        if frame == .zero {
            translatesAutoresizingMaskIntoConstraints = false
        }
        self.titleLabel.text = title
        self.subtitleLabel.text = subtitle
        setupLayout()
    }
    
    var itemsLeft:Int = 0 {
        didSet {
            self.subtitleLabel.text = "\(itemsLeft) More"
        }
    }
    
    func setupLayout() {
        addSubview(bg)
        bg.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        bg.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 12).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 36).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        subtitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 36).isActive = true
        subtitleLabel.rightAnchor.constraint(equalTo: centerXAnchor, constant: 50).isActive = true
        
        addSubview(addButton)
        addButton.bottomAnchor.constraint(equalTo: subtitleLabel.bottomAnchor).isActive = true
        addButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -50).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor, multiplier: 1).isActive = true
        
        addSubview(menuButton)
        menuButton.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor).isActive = true
        menuButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -50).isActive = true
        menuButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        menuButton.widthAnchor.constraint(equalToConstant: 75).isActive = true
        
        addButton.addTarget(self, action: #selector(self.handleAddButton), for: .touchUpInside)
        menuButton.addTarget(self, action: #selector(self.handleMenu), for: .touchUpInside)
    }
    
    @objc func handleAddButton() {
        if let delegate = self.delegate {
            delegate.openAddItemPopup()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
