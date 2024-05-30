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
        
        tasks = [TaskModel("nome0", true),TaskModel("nome1", false),TaskModel("nome2", true)]
    }
}
