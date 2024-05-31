//
//  TaskStore.swift
//  ToDoList
//
//  Created by Carlos Pacheco on 30/05/24.
//

import Foundation

class TaskStore {
    let defaults = UserDefaults.standard
    var tasks: [Task] = []
    
    init() {
        if let savedData = defaults.object(forKey: "tasks") as? Data {
            do{
                tasks = try JSONDecoder().decode([Task].self, from: savedData)
            } catch {
                tasks = []
            }
        }
    }
    
    public func create(task: Task) {
        tasks.append(task)
        save()
    }
    
    public func delete(task: Task) {
        tasks.removeAll { $0.id == task.id }
        save()
    }
    
    public func update(task: Task) {
        let idx = tasks.firstIndex { $0.id == task.id }
        
        guard let idx else {
            fatalError("Task out of bounds")
        }
        
        tasks[idx].title = task.title
        tasks[idx].isCompleted = task.isCompleted
        
        save()
    }
    
    private func save() {
        do {
            let encodedData = try JSONEncoder().encode(tasks)
            defaults.set(encodedData, forKey: "tasks")
        } catch {
            fatalError("Unable to save")
        }
    }
}
