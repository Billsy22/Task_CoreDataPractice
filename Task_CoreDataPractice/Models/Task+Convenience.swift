//
//  Task+Convenience.swift
//  Task_CoreDataPractice
//
//  Created by Taylor Bills on 2/19/19.
//  Copyright © 2019 Taylor Bills. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    
    // MARK: -  Convenience Initializer
    
    convenience init(name : String, notes : String, due : Date, context : NSManagedObjectContext = CoreDataStack.context) {
        self.init(context : context)
        self.name = name
    }
}
