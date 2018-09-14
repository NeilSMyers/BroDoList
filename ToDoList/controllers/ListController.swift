//
//  ListController.swift
//  BroDoList
//
//  Created by Neil Myers on 7/14/18.
//  Copyright © 2018 WatchFoxWare. All rights reserved.
//

import UIKit

class ListController: UIViewController, BDHeaderDelegate, BDNewItemDelegate {
    
    func openAddItemPopup() {
        popup.animatePopup()
    }
    
    func notInList(text:String) -> Bool {
        var isNotInList = true
        self.listData.forEach { (toDo) in
            if toDo.title == text {
                isNotInList = false
            }
        }
        return isNotInList
    }
    
    func addItemToList(text:String) {
        if (notInList(text:text)) {
            let newItem = ToDo(id: self.listData.count, title: text, status: false)
            self.listData.append(newItem)
            self.listTable.reloadData()
            self.updateHeaderItemsLeft()
            self.popup.textField.text = ""
            self.popup.animatePopup()
        }
    }
    
    let header = BDHeaderView(title: "Stuff to like...do", subtitle: "X Left")
    let popup = BDNewItemPopup()
    
    let tbInset:CGFloat = 16
    var bgBottom:NSLayoutConstraint!
    
    lazy var bg:UIView = {
        let view = BDGradient()
        view.layer.cornerRadius = tbInset
        return view
    }()
    
    let listTable = BDTableView()
    
    let CELL_ID = "cell_id"
    
    var listData:[ToDo] = [ToDo]()
    
    var keyboardHeight:CGFloat = 250
    
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        let keyboardSize = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
        self.keyboardHeight = keyboardSize.height
    }
    
    func updateHeaderItemsLeft() {
        header.itemsLeft = 0
        self.listData.forEach { (toDo) in
            if !toDo.status { header.itemsLeft += 1 }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listData = []
        
        self.updateHeaderItemsLeft()
        
        view.backgroundColor = .white
        
        view.addSubview(header)
        header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        header.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        header.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        header.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        view.addSubview(bg)
        bg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        bg.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 10).isActive = true
        bg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        bgBottom = bg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120)
        bgBottom.isActive = true
        
        view.addSubview(listTable)
        listTable.leftAnchor.constraint(equalTo: bg.leftAnchor, constant: tbInset).isActive = true
        listTable.topAnchor.constraint(equalTo: bg.topAnchor, constant: tbInset).isActive = true
        listTable.rightAnchor.constraint(equalTo: bg.rightAnchor, constant: -tbInset).isActive = true
        listTable.bottomAnchor.constraint(equalTo: bg.bottomAnchor, constant: -tbInset).isActive = true
        
        view.addSubview(popup)
        popup.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        popup.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        popup.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        popup.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        openAddItemPopup()
        
        popup.textField.delegate = self
        popup.delegate = self
        
        header.delegate = self
        
        listTable.delegate = self
        listTable.dataSource = self
        listTable.register(BDListCell.self, forCellReuseIdentifier: CELL_ID)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension ListController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        var heightToAnimate = -keyboardHeight - 14
  
        if textField == popup.textField {
            popup.animateView(transform: CGAffineTransform(translationX: 0, y: -keyboardHeight), duration: 0.5)
            heightToAnimate -= 86
        }
        self.bgBottom.constant = heightToAnimate
        UIView.animate(withDuration: 0.35) {
            self.view.layoutIfNeeded()
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.bgBottom.constant = -100
        UIView.animate(withDuration: 0.35) {
            self.view.layoutIfNeeded()
        }
        if textField == popup.textField {
            popup.animateView(transform: CGAffineTransform(translationX: 0, y: 0), duration: 0.6)
        }
    }
}

extension ListController: UITableViewDelegate, UITableViewDataSource, BDListCellDelegate {
    
    func toggleToDo(toDo updatedToDo:ToDo) {
        let newListData = self.listData.map { (oldToDo) -> ToDo in
            if oldToDo.id == updatedToDo.id {
                var newToDo = oldToDo
                newToDo.status = updatedToDo.status
                newToDo.title = updatedToDo.title
                return newToDo
            }
            return oldToDo
        }
        self.listData = newListData
        self.listTable.reloadData()
        self.updateHeaderItemsLeft()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "To Do"
        }
        return "Done"
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleForHeader = BDLabel(color: .white, size: 20, frame: CGRect(x:0, y:0, width: tableView.frame.width, height: 44))
        if section == 0 {
            titleForHeader.text = "To Do"
        } else {
            titleForHeader.text = "Done"
        }
        return titleForHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 38
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        self.listData.forEach { (toDo) in
            if(section == 0 && !toDo.status) {
                count += 1
            } else if (section == 1 && toDo.status) {
                count += 1
            }
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as! BDListCell
        cell.delegate = self
        cell.textField.delegate = self
        var itemsForSection:[ToDo] = []
        self.listData.forEach { (toDo) in
            if indexPath.section == 0 && !toDo.status {
                itemsForSection.append(toDo)
            } else if (indexPath.section == 1 && toDo.status) {
                itemsForSection.append(toDo)
            }
        }
        cell.toDo = itemsForSection[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 42
    }
    
}
