//
//  BDTableView.swift
//  BroDoList
//
//  Created by Neil Myers on 8/12/18.
//  Copyright © 2018 WatchFoxWare. All rights reserved.
//

import UIKit

class BDTableView:UITableView {
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        checkIfAutoLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
