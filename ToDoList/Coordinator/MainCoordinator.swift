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
        let viewModel = ListViewModel(coordinator: self)
        let viewControllr = TaskListViewController(viewModel)
        
        navigationController.setViewControllers([viewControllr], animated: false)
    }
    
    func eventOccurred(with type: Event) {
        switch type {
        case .novo: 
            let viewModel = DetailViewModel(task: Task())
            let destVC = DetailViewController(viewModel)
            let navController = UINavigationController(rootViewController: destVC)

            navigationController.present(navController, animated: true)
            
        case .editar(let task):
            let viewModel = DetailViewModel(task: task)
            let destVC = DetailViewController(viewModel)
            let navController = UINavigationController(rootViewController: destVC)

            navigationController.present(navController, animated: true)
        }
    }
}
