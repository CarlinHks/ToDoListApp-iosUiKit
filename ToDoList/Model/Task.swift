//
//  TaskModel.swift
//  ToDoList
//
//  Created by Carlos Pacheco on 30/05/24.
//

import Foundation

struct Task: Codable {
    var title: String
    var isCompleted: Bool
    var id = UUID()
    
    init(_ title: String = "To Do", _ isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
    }
}
