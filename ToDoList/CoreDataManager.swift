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
    
    func createToDo() {
        let context = persistentContainer.viewContext
        let toDo = NSEntityDescription.insertNewObject(forEntityName: "ToDo", into: context)
        
        let id = 1
        let title = "Let's Do This!"
        let status = false
        
        toDo.setValue(id, forKey: "id")
        toDo.setValue(title, forKey: "title")
        toDo.setValue(status, forKey: "status")
        
        do {
            try context.save()
        } catch let err {
            print("failed to save context with new toDo:",err)
        }
    }
    
    func fetchToDos() -> [ToDo] {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ToDo>(entityName: "ToDo")
        
        do {
            let toDos = try context.fetch(fetchRequest)
            return toDos
        } catch let err {
            print("failed to save context with new toDo:",err)
            return []
        }
    }
}
