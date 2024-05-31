//
//  TaskListViewModel.swift
//  ToDoList
//
//  Created by Carlos Pacheco on 30/05/24.
//

import Foundation

class TaskListViewModel {
    var coordinator: Coordinator
    var taskStore: TaskStore
    
    init(coordinator: Coordinator, taskStore: TaskStore) {
        self.coordinator = coordinator
        self.taskStore = taskStore
    }
}
