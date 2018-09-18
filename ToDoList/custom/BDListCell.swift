//
//  BDListCell.swift
//  BroDoList
//
//  Created by Neil Myers on 8/15/18.
//  Copyright © 2018 WatchFoxWare. All rights reserved.
//

import UIKit

class BDListCell:UITableViewCell {
    
    var delegate:BDListCellDelegate?
    
    @objc func toggleStatus() {
        if let delegate = self.delegate, let toDo = self.toDo {
//            let newToDo = ToDo(id: toDo.id, title: textField.text!, status: !toDo.status)
//            delegate.toggleToDo(toDo: newToDo)
        }
    }
    
    let textField = BDTextField(placeholder: "ToDo", radius: 6, inset: 12)
    let view:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let box = GDCheckBox()
    
    var toDo:ToDo? {
        didSet {
            if let toDo = toDo {
                box.toggled = toDo.status
                textField.text = toDo.title
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        box.addTarget(self, action: #selector(self.toggleStatus), for: .touchUpInside)
        
        selectionStyle = .none
        backgroundColor = .clear
        
        view.backgroundColor = .white
        
        addSubview(view)
        view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        view.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        view.addSubview(textField)
        textField.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        textField.topAnchor.constraint(equalTo: topAnchor, constant: 6).isActive = true
        textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6).isActive = true
        textField.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(box)
        box.rightAnchor.constraint(equalTo: rightAnchor, constant: -14).isActive = true
        box.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        box.widthAnchor.constraint(equalToConstant: 18).isActive = true
        box.heightAnchor.constraint(equalTo: box.widthAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
