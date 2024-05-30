//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Carlos Pacheco on 30/05/24.
//

import Foundation

class ListViewModel {
    var coordinator: Coordinator
    var tasks: [TaskModel] = []
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
        
        tasks = [
            TaskModel("nome0", false),
            TaskModel("nome1 muito grande que não cabe em uma palavra só, que coisa não?", false),
            TaskModel("nome2", true)
        ]
    }
}
