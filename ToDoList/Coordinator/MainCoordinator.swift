//
//  MainCoordinator.swift
//  ToDoList
//
//  Created by Carlos Pacheco on 30/05/24.
//

import UIKit

class MainCoordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

// MARK: Coordinator
extension MainCoordinator: Coordinator {
    func start() {
        let viewModel = TaskListViewModel(coordinator: self)
        let viewControllr = TaskListViewController(viewModel)
        
        navigationController.setViewControllers([viewControllr], animated: false)
    }
    
    func eventOccurred(with type: Event) {
        switch type {
        case .novo: 
            let viewModel = TaskDetailViewModel(task: Task())
            let destVC = TaskDetailViewController(viewModel)
            let navController = UINavigationController(rootViewController: destVC)

            navigationController.present(navController, animated: true)
            
        case .editar(let task):
            let viewModel = TaskDetailViewModel(task: task)
            let destVC = TaskDetailViewController(viewModel)
            let navController = UINavigationController(rootViewController: destVC)

            navigationController.present(navController, animated: true)
        }
    }
}
