//
//  ProfileHeaderView.swift
//  Navigation5
//
//  Created by Айгерим on 27.03.2024.
//
import Foundation
import UIKit

class ProfileHeaderView: UIView {
    
    
    private lazy var fullnameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = "Hipster Cat"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "cat")
        imageView.layer.cornerRadius = 60
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        
        return imageView
    }()
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .gray
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.text = textInputContextIdentifier
        textField.placeholder = "Введите статус"
        textField.backgroundColor = .gray
        textField.textColor = .gray
        
        return textField
    }()
    
    private lazy var showStatusButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 10
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(statusButtonPressed), for: .touchUpInside)
        return button
    }()
    private var statusLabel: UILabel {
        let labelTwo = UILabel()
        labelTwo.numberOfLines = 1
        labelTwo.text = "StatusLabel"
        labelTwo.textColor = .black
        labelTwo.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        labelTwo.translatesAutoresizingMaskIntoConstraints = false
        return labelTwo
        
    }
    private var statusText = "status"
    
    private lazy var stackView: UIStackView = { [unowned self] in
           let stackView = UIStackView()
           
           stackView.translatesAutoresizingMaskIntoConstraints = false
           stackView.clipsToBounds = true
           
        stackView.axis = .vertical
           stackView.distribution = .fillEqually
           stackView.alignment = .fill
           stackView.spacing = 0.0
               
           stackView.addArrangedSubview(self.fullnameLabel)
           stackView.addArrangedSubview(self.statusLabel)
           stackView.addArrangedSubview(self.statusTextField)
           
           return stackView
       }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    
        addSubview(avatarImageView)
    
        addSubview(showStatusButton)
        addSubview(stackView)
        
        
        setupContraints()
        statusTextField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        
        
    }
    
    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? ""
    }
    
    @objc private func statusButtonPressed() {
        print(statusTextField.text ?? "no text")
        
    }
    
    
    private func  setupContraints() {
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 120),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo:avatarImageView.trailingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 120),
        
            
            showStatusButton.topAnchor.constraint( equalTo: stackView.bottomAnchor, constant: 42),
            showStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            showStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            showStatusButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
            
        ])
    }
    
    
}
extension ProfileHeaderView: UITextFieldDelegate {
    
    // tap 'done' on the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
