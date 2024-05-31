//
//  DetailViewModel.swift
//  ToDoList
//
//  Created by Carlos Pacheco on 30/05/24.
//

import Foundation

class TaskDetailViewModel {
    let task: Task
    var isNew = false
    
    init(task: Task?) {
        if let task = task {
            self.task = task
        } else {
            self.task = Task()
            isNew = true
        }
    }
}
