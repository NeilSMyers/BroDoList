//
//  BDNewItemPopup.swift
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
    var delegate:BDNewItemDelegate?
    
    @objc func handleCancel() {
        textField.resignFirstResponder()
        animatePopup()
    }
    
    var popupLocation:CGFloat = 90
    
    @objc func animatePopup() {
        textField.resignFirstResponder()
        self.animateView(transform: CGAffineTransform(translationX: 0, y: popupLocation), duration: 0.3)
        if popupLocation == 90 {
            popupLocation = 0
        } else {
            popupLocation = 90
        }
    }
    
    @objc func handleAdd() {
        if let delegate = self.delegate, let textFieldText = self.textField.text {
            delegate.addItemToList(text: textFieldText)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.animatePopup)))
        
        let inset:CGFloat = 12
        
        self.layer.cornerRadius = 16
//        self.layer.masksToBounds = true
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
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
