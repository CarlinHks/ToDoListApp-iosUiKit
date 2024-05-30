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
    
    func start() {
        let viewModel = ListViewModel(coordinator: self)
        let viewControllr = ListViewController(viewModel)
        
        navigationController.setViewControllers([viewControllr], animated: false)
    }
    
    
}

// MARK: Coordinator
extension MainCoordinator: Coordinator {
    
}
