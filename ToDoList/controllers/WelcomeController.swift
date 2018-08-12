//
//  ViewController.swift
//  ToDoList
//
//  Created by Neil Myers on 7/3/18.
//  Copyright © 2018 WatchFoxWare. All rights reserved.
//

import UIKit

class WelcomeController: UIViewController {

    let bg:UIView = {
        let view = BDGradient()
        view.layer.cornerRadius = 24
        return view
    }()
    
    let titleLabel = BDLabel(title: "BROOOOO", size: 24, textAlign: .center)
    
    let infoLabel:UILabel = {
        let label = BDLabel(title: "READY TO LIKE, GET STUFF DONE OR WHATEVER?", size: 15, textAlign: .center)
        label.numberOfLines = 2
        return label
    }()
    
    let nextButton:UIButton = BDButton(title: "FUGG IT UP, DUDE", type: .roundedText)
    
    let copyright = BDLabel(title: "© 2018 | WatchFoxWare", color: .grayOne, size: 14, textAlign: .center)
    
    @objc func handleNext() {
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.nextButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { (_) in
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                self.nextButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            }) { (_) in
                self.present(ListController(), animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.addTarget(self, action: #selector(self.handleNext), for: [.touchUpInside, .touchUpOutside])
      
        view.backgroundColor = .white
        
        view.addSubview(bg)
        bg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        bg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        bg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        bg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        
        bg.addSubview(titleLabel)
        titleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: bg.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: bg.topAnchor, constant: 60).isActive = true
        
        bg.addSubview(infoLabel)
        infoLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        infoLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        infoLabel.centerXAnchor.constraint(equalTo: bg.centerXAnchor).isActive = true
        infoLabel.centerYAnchor.constraint(equalTo: bg.centerYAnchor).isActive = true
        
        bg.addSubview(nextButton)
        nextButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: bg.centerXAnchor).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: bg.bottomAnchor, constant: -60).isActive = true
        
        view.addSubview(copyright)
        copyright.widthAnchor.constraint(equalToConstant: 200).isActive = true
        copyright.heightAnchor.constraint(equalToConstant: 40).isActive = true
        copyright.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        copyright.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
    }

}
