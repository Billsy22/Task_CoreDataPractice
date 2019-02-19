//
//  CoreDataStack.swift
//  Task_CoreDataPractice
//
//  Created by Taylor Bills on 2/19/19.
//  Copyright © 2019 Taylor Bills. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataStack {
    
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Task")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    static var context: NSManagedObjectContext {
        return container.viewContext
    }
}

