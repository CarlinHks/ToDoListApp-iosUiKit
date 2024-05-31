//
//  TaskListViewModel.swift
//  ToDoList
//
//  Created by Carlos Pacheco on 30/05/24.
//

import Foundation

class TaskListViewModel {
    var coordinator: Coordinator
    var tasks: [Task] = []
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
        
        tasks = [
            Task("nome0", false),
            Task("nome1 muito grande que não cabe em uma palavra só, que coisa não?", false),
            Task("nome2", true)
        ]
    }
}
