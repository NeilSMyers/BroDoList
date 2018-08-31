//
//  protocol.swift
//  ToDoList
//
//  Created by Neil Myers on 7/17/18.
//  Copyright © 2018 WatchFoxWare. All rights reserved.
//

import Foundation

protocol BDHeaderDelegate {
    func openAddItemPopup()
}

protocol BDNewItemDelegate {
    func addItemToList(text:String)
}

protocol BDListCellDelegate {
    func toggleToDo(id: Int, status:Bool)
}
