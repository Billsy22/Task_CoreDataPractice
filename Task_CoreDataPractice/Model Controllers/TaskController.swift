//
//  TaskController.swift
//  Task_CoreDataPractice
//
//  Created by Taylor Bills on 2/19/19.
//  Copyright © 2019 Taylor Bills. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    // MARK: -  Properties
    
    static let shared = TaskController()
    var tasks : [Task] = []
    
    // MARK: -  CRUD
    
    func addTask(withName : String, notes : String, due : Date) {
        let newTask = Task(name: withName, notes: notes, due: due)
        self.tasks.insert(newTask, at: 0)
        saveToCoreData()
    }
    
    func update(task : Task, name : String, notes : String, due : Date) {
        task.name = name
        task.notes = notes
        task.due = due
        saveToCoreData()
    }
    
    func remove(task: Task) {
        guard let index = self.tasks.index(of: task) else { print("Task Doesn't Exist"); return }
        self.tasks.remove(at: index)
        saveToCoreData()
    }
    
    func saveToCoreData() {
        try? CoreDataStack.context.save()
    }
    
    func fetchTasks() -> [Task] {
        let request : NSFetchRequest<Task> = Task.fetchRequest()
        return (try? CoreDataStack.context.fetch(request)) ?? []
    }
}
