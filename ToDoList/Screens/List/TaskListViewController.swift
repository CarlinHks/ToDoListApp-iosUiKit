//
//  TaskListViewController.swift
//  ToDoList
//
//  Created by Carlos Pacheco on 30/05/24.
//

import UIKit

class TaskListViewController : UITableViewController{
    var listViewModel: TaskListViewModel
    
    init(_ listViewModel: TaskListViewModel) {
        self.listViewModel = listViewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        navigationItem.title = "To Do List"
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addButtonTapped() {
        listViewModel.coordinator.eventOccurred(with: .novo)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listViewModel.taskStore.tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
            fatalError("Dequeue CustomCell error.")
        }
        
        let task = listViewModel.taskStore.tasks[indexPath.row]
        
        cell.configure(task: task)
                
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let task = listViewModel.taskStore.tasks[indexPath.row]
        listViewModel.coordinator.eventOccurred(with: .editar(task: task))
    }
}
