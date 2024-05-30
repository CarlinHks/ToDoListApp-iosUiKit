//
//  DetailViewController.swift
//  ToDoList
//
//  Created by Carlos Pacheco on 30/05/24.
//

import UIKit

class DetailViewController: UIViewController {
    let detailViewModel: DetailViewModel
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let completedLabel: UILabel = {
        let label = UILabel()
        label.text = "Completed"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let titleTextView: UITextView = {
        let text = UITextView()
        text.textAlignment = .justified
        text.textColor = .label
        text.font = .systemFont(ofSize: 24, weight: .regular)
        text.layer.borderColor = UIColor.black.cgColor
        text.layer.borderWidth = 0.5
        text.layer.cornerRadius = 10
        text.isScrollEnabled = true
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
    
    private let salvarButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Salvar", for: .normal)
        btn.backgroundColor = .blue
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    private let isCompletedImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "flag.slash.circle")
        iv.tintColor = .label
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        return iv
    }()
    
    private let toggle: UISwitch = {
        let switchView = UISwitch()
        switchView.translatesAutoresizingMaskIntoConstraints = false
        
        return switchView
    }()
    
    init(_ detailViewModel: DetailViewModel) {
        self.detailViewModel = detailViewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configure()
    }
    
    private func configure() {
        titleTextView.text = detailViewModel.task.title
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        setupUITitleLabel()
        setupUITextField()
        setupUIIsCompletedImageView()
        setupUIToggle()
        setupUICompletedLabel()
        setupUISalvarButton()
    }
    
    private func setupUITitleLabel() {
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupUITextField() {
        let padding: CGFloat = 16
        
        view.addSubview(titleTextView)
        
        NSLayoutConstraint.activate([
            titleTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            titleTextView.heightAnchor.constraint(greaterThanOrEqualToConstant: 300),
            titleTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            titleTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
    }
    
    private func setupUIIsCompletedImageView() {
        view.addSubview(isCompletedImageView)
        
        NSLayoutConstraint.activate([
            isCompletedImageView.topAnchor.constraint(equalTo: titleTextView.bottomAnchor, constant: 8),
            isCompletedImageView.heightAnchor.constraint(equalToConstant: 48),
            isCompletedImageView.widthAnchor.constraint(equalToConstant: 48),
            isCompletedImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8)
        ])
    }
    
    private func setupUIToggle() {
        view.addSubview(toggle)
        
        NSLayoutConstraint.activate([
            toggle.centerYAnchor.constraint(equalTo: isCompletedImageView.centerYAnchor),
            toggle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            toggle.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    private func setupUICompletedLabel() {
        view.addSubview(completedLabel)
        
        NSLayoutConstraint.activate([
            completedLabel.centerYAnchor.constraint(equalTo: isCompletedImageView.centerYAnchor),
            completedLabel.leadingAnchor.constraint(equalTo: isCompletedImageView.trailingAnchor, constant: 8),
            completedLabel.trailingAnchor.constraint(equalTo: toggle.leadingAnchor, constant: 8)
        ])
    }
    
    private func setupUISalvarButton() {
        let padding: CGFloat = 16
        
        view.addSubview(salvarButton)
        
        NSLayoutConstraint.activate([
            salvarButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            salvarButton.heightAnchor.constraint(greaterThanOrEqualToConstant: 30),
            salvarButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            salvarButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
    }
}
