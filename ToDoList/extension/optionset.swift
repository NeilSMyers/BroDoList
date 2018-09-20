//
//  optionset.swift
//  ToDoList
//
//  Created by Neil Myers on 7/14/18.
//  Copyright © 2018 WatchFoxWare. All rights reserved.
//

import UIKit

struct ButtonOptions: OptionSet {
    let rawValue: Int
    
    static let roundedText = ButtonOptions(rawValue: 1 << 0)
    static let squareIcon = ButtonOptions(rawValue: 1 << 1)
}
