//
//  TaskListViewModel.swift
//  ToDoList
//
//  Created by Carlos Pacheco on 30/05/24.
//

import Foundation

class TaskListViewModel {
    private var coordinator: Coordinator
    private var taskStore: TaskStore
    
    public var tasks: [Task] {
        taskStore.tasks
    }
    
    init(coordinator: Coordinator, taskStore: TaskStore) {
        self.coordinator = coordinator
        self.taskStore = taskStore
    }
    
    public func actionDelete(idx: Int) {
        let task = taskStore.tasks[idx]
        taskStore.delete(task: task)
    }
    
    public func addButtonTapped() {
        coordinator.eventOccurred(with: .novo)
    }
    
    public func editar(task: Task) {
        coordinator.eventOccurred(with: .editar(task: task))
    }
}
