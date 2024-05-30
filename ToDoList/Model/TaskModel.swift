//
//  TaskModel.swift
//  ToDoList
//
//  Created by Carlos Pacheco on 30/05/24.
//

import Foundation

class TaskModel {
    var title = ""
    var isCompleted = false
    
    init(_ title: String = "", _ isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
    }
}
