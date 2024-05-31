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
    private var taskUUID: UUID?
    
    public var reloadTable: (() -> Void)?

    
    public var tasks: [Task] {
        taskStore.tasks.value ?? []
    }
    
    init(coordinator: Coordinator, taskStore: TaskStore) {
        self.coordinator = coordinator
        self.taskStore = taskStore
        
        configureObservable()
    }
    
    deinit {
        taskStore.tasks.unbind(id: taskUUID)
    }
    
    private func configureObservable() {
        taskUUID = taskStore.tasks.bind({ _ in
            self.reloadTable?()
        })
    }
    
    public func actionDelete(idx: Int) {
        let task = tasks[idx]
        taskStore.delete(task: task)
    }
    
    public func addButtonTapped() {
        coordinator.eventOccurred(with: .new)
    }
    
    public func editar(task: Task) {
        coordinator.eventOccurred(with: .edit(task: task))
    }
}
