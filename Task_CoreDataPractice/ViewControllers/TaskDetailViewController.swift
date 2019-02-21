//
//  TaskDetailViewController.swift
//  Task_CoreDataPractice
//
//  Created by Taylor Bills on 2/19/19.
//  Copyright © 2019 Taylor Bills. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {

    // MARK: -  Properties
    
    var task : Task?
    var dueDate: Date?
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    
    // MARK: -  Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: -  Actions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let nameText = nameTextField.text, let notesText = notesTextView.text else { return }
        if task == nil {
            TaskController.shared.addTask(withName: nameText, notes: notesText, due: Date())
        } else {
            TaskController.shared.update(task: self.task!, name: nameText, notes: notesText, due: Date())
        }
        navigationController?.popViewController(animated: true)
    }
    
    func updateViews() {
        if task != nil {
            nameTextField.text = task!.name
            notesTextView.text = task!.notes
        }
    }
}
