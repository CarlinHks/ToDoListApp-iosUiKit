//
//  MainCoordinator.swift
//  ToDoList
//
//  Created by Carlos Pacheco on 30/05/24.
//

import UIKit

class MainCoordinator {
    var navigationController: UINavigationController
    let taskStore: TaskStore
    
    init(navigationController: UINavigationController, taskStore: TaskStore) {
        self.navigationController = navigationController
        self.taskStore = taskStore
    }
}

// MARK: Coordinator
extension MainCoordinator: Coordinator {
    func start() {
        let viewModel = TaskListViewModel(coordinator: self, taskStore: taskStore)
        let viewControllr = TaskListViewController(viewModel)
        
        navigationController.setViewControllers([viewControllr], animated: false)
    }
    
    func eventOccurred(with type: Event) {
        switch type {
        case .new: 
            let viewModel = TaskDetailViewModel(task: nil, coordinator: self, taskStore: taskStore)
            let destVC = TaskDetailViewController(viewModel)
            
            navigationController.pushViewController(destVC, animated: true)
            
        case .edit(let task):
            let viewModel = TaskDetailViewModel(task: task, coordinator: self, taskStore: taskStore)
            let destVC = TaskDetailViewController(viewModel)
            
            navigationController.pushViewController(destVC, animated: true)
            
        case .dissmiss:
            navigationController.popViewController(animated: true)
        }
    }
}
