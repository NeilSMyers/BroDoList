//
//  ListController.swift
//  ToDoList
//
//  Created by Neil Myers on 7/14/18.
//  Copyright © 2018 WatchFoxWare. All rights reserved.
//

import UIKit

class ListController: UIViewController, TDHeaderDelegate {
    
    func addItem() {
        print("trying to add item from header")
    }
    
    let header = TDHeaderView(title: "Stuff to get done", subtitle: "4 left")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(header)
        header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        header.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        header.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        header.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        header.delegate = self
    }
}
