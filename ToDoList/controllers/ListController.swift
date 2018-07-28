//
//  ListController.swift
//  ToDoList
//
//  Created by Neil Myers on 7/14/18.
//  Copyright © 2018 WatchFoxWare. All rights reserved.
//

import UIKit

class ListController: UIViewController, BDHeaderDelegate {
    
    func addItem() {
        print("trying to add item from header")
    }
    
    let header = BDHeaderView(title: "Stuff to like...do", subtitle: "4 left")
    let popup = BDNewItemPopup()
    
    var keyboardHeight:CGFloat = 0
    
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        let keyboardSize = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
        self.keyboardHeight = keyboardSize.height
        print(self.keyboardHeight)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(header)
        header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        header.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        header.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        header.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        view.addSubview(popup)
        popup.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        popup.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        popup.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        popup.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        header.delegate = self
    }
}
