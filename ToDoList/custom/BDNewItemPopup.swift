//
//  NewItemPopup.swift
//  BroDoList
//
//  Created by Neil Myers on 7/27/18.
//  Copyright © 2018 WatchFoxWare. All rights reserved.
//

import UIKit

class BDNewItemPopup:BDGradient {
    
    let cancel = BDButton(title: " negatory ", type: .roundedText, radius: 5)
    let add = BDButton(title: " pitted ", type: .roundedText, radius: 5)
    let textField = BDTextField(placeholder: "fugg it up dugg", inset: 6)
    
    @objc func handleCancel() {
        print("handle cancel")
    }
    
    @objc func handleAdd() {
        print("handle add")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let inset:CGFloat = 12
        
        self.layer.cornerRadius = 14
        
        addSubview(cancel)
        cancel.leftAnchor.constraint(equalTo: leftAnchor, constant: inset).isActive = true
        cancel.topAnchor.constraint(equalTo: topAnchor, constant: inset).isActive = true
        cancel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        addSubview(add)
        add.rightAnchor.constraint(equalTo: rightAnchor, constant: -inset).isActive = true
        add.topAnchor.constraint(equalTo: topAnchor, constant: inset).isActive = true
        add.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        addSubview(textField)
        textField.leftAnchor.constraint(equalTo: leftAnchor, constant: inset).isActive = true
        textField.rightAnchor.constraint(equalTo: rightAnchor, constant: -inset).isActive = true
        textField.topAnchor.constraint(equalTo: add.bottomAnchor, constant: 8).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        cancel.addTarget(self, action: #selector(self.handleCancel), for: .touchUpInside)
        add.addTarget(self, action: #selector(self.handleAdd), for: .touchUpInside)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
