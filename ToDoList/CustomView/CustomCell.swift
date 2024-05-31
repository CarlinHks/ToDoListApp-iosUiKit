//
//  CustomCell.swift
//  ToDoList
//
//  Created by Carlos Pacheco on 30/05/24.
//

import UIKit

class CustomCell: UITableViewCell {
    static let identifier = "CustomCell"
    
    private lazy var isCompletedImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "flag.slash.circle")
        iv.tintColor = .label
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        return iv
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.text = "ERROR"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(task: Task) {
        isCompletedImageView.image = UIImage(systemName: task.isCompleted ? "flag.checkered" : "flag")
        titleLabel.text = task.title
    }
    
    private func setupUI() {
        contentView.addSubview(isCompletedImageView)
        contentView.addSubview(titleLabel)
        
        let imgSize: CGFloat = 24
        
        NSLayoutConstraint.activate([
            isCompletedImageView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            isCompletedImageView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            isCompletedImageView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            isCompletedImageView.widthAnchor.constraint(equalToConstant: imgSize),
            
            titleLabel.leadingAnchor.constraint(equalTo: isCompletedImageView.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
