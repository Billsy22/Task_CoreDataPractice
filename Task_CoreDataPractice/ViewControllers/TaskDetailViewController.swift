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
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    
    // MARK: -  Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
