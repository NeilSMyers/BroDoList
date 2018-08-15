//
//  BDListCell.swift
//  BroDoList
//
//  Created by Neil Myers on 8/15/18.
//  Copyright © 2018 WatchFoxWare. All rights reserved.
//

import UIKit

class BDListCell:UITableViewCell {
    
    var toDo:ToDo? {
        didSet {
            if let toDo = toDo {
                print(toDo.status)
                self.textLabel?.text = toDo.title
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = .white
        textLabel?.textColor = .grayZero
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
