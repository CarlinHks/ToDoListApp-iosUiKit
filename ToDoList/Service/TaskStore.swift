//
//  TaskStore.swift
//  ToDoList
//
//  Created by Carlos Pacheco on 30/05/24.
//

import Foundation

class TaskStore {
    let defaults = UserDefaults.standard
    var tasks: Observable<[Task]> = Observable([])
    var taskUUID: UUID?
    
    init() {
        if let savedData = defaults.object(forKey: "tasks") as? Data {
            do{
                tasks.value = try JSONDecoder().decode([Task].self, from: savedData)
            } catch {
                tasks.value = []
            }
        }
        
        configureTask()
    }
    
    deinit {
        tasks.unbind(id: taskUUID)
    }
    
    private func configureTask() {
        taskUUID =  tasks.bind { _ in self.save() }
    }
    
    public func create(task: Task) {
        var currentTasks = tasks.value ?? []
        currentTasks.append(task)
        tasks.value = currentTasks
    }
    
    public func delete(task: Task) {
        var currentTasks = tasks.value ?? []
        currentTasks.removeAll { $0.id == task.id }
        tasks.value = currentTasks
    }
    
    public func update(task: Task) {
        var currentTasks = tasks.value ?? []
        let idx = currentTasks.firstIndex { $0.id == task.id }
        
        guard let idx else {
            fatalError("Task out of bounds")
        }
        
        currentTasks[idx].title = task.title
        currentTasks[idx].isCompleted = task.isCompleted
        
        tasks.value = currentTasks
    }
    
    private func save() {
        do {
            let encodedData = try JSONEncoder().encode(tasks.value)
            defaults.set(encodedData, forKey: "tasks")
        } catch {
            fatalError("Unable to save")
        }
    }
}
