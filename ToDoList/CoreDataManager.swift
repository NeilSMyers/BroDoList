//
//  CoreDataManager.swift
//  BroDoList
//
//  Created by Neil Myers on 9/17/18.
//  Copyright © 2018 WatchFoxWare. All rights reserved.
//

import CoreData

struct CoreDataManager {
    
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "BroDoList")
        container.loadPersistentStores { (storeDescription, err) in
            if let err = err {
                fatalError("loading of store failed: \(err)")
            }
        }
        return container
    }()
    
}
