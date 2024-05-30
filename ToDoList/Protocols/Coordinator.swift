//
//  Coordinator.swift
//  ToDoList
//
//  Created by Carlos Pacheco on 30/05/24.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
