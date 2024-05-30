//
//  TaskModel.swift
//  ToDoList
//
//  Created by Carlos Pacheco on 30/05/24.
//

import Foundation

class TaskModel {
    var title: String
    var isCompleted: Bool
    
    init(_ title: String = "To Do", _ isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
    }
}
