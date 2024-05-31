//
//  DetailViewModel.swift
//  ToDoList
//
//  Created by Carlos Pacheco on 30/05/24.
//

import Foundation

class TaskDetailViewModel {
    private let coordinator: Coordinator
    private let taskStore: TaskStore
    
    var task: Task
    var isNew = false
    
    init(task: Task?, coordinator: Coordinator, taskStore: TaskStore) {
        self.taskStore = taskStore
        self.coordinator = coordinator
        
        if let task = task {
            self.task = task
        } else {
            self.task = Task()
            isNew = true
        }
    }
    
    public func dissmiss() {
        coordinator.eventOccurred(with: .dissmiss)
    }
    
    public func save(title: String, isCompleted: Bool) {
        task.title = title
        task.isCompleted = isCompleted
        
        if (isNew) {
            taskStore.create(task: task)
        } else {
            taskStore.update(task: task)
        }
    }
}
