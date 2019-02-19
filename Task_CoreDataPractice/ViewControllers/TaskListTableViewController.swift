//
//  TaskListTableViewController.swift
//  Task_CoreDataPractice
//
//  Created by Taylor Bills on 2/19/19.
//  Copyright © 2019 Taylor Bills. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController {

    // MARK: -  Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: -  Table View Data Source Functions
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskController.shared.tasks.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: taskCellIdentifier, for: indexPath)
        let task = TaskController.shared.tasks[indexPath.row]
        cell.textLabel?.text = task.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = TaskController.shared.tasks[indexPath.row]
            TaskController.shared.remove(task: task)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: -  Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == taskDetailSegueIdentifier {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let task = TaskController.shared.tasks[indexPath.row]
            let taskDetailVC = segue.destination as? TaskDetailViewController
            taskDetailVC?.task = task
        }
    }
}
