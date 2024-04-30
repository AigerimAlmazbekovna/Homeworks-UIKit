//
//  ProfileHeaderView.swift
//  Navigation5
//
//  Created by Айгерим on 27.03.2024.
//
import Foundation
import UIKit
import SnapKit


final class ProfileHeaderView: UITableViewHeaderFooterView {
    
    var fullnameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = "Hipster Cat"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
     var avatarImageView: UIImageView = {
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
    //Замените для всех экранов стандартные UIButton на вашу собственную CustomButton там, где это целесообразно. Обратите внимание, насколько ваш исходный код стал компактнее и яснее.
    private lazy var showStatusButton: CustomButton = {
        let button = CustomButton(title: "Show status", titleColor: .white) { [weak self] in
            self?.statusButtonPressed()
                    }
        return button
    }()
      //  button.tintColor = .white
       // button.translatesAutoresizingMaskIntoConstraints = false
       // button.backgroundColor = .systemBlue
       // button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
      //  button.layer.cornerRadius = 10
       // button.layer.shadowOffset = CGSize(width: 4, height: 4)
      //  button.layer.shadowColor = UIColor.black.cgColor
      //  button.layer.shadowRadius = 4
       // button.layer.shadowOpacity = 0.7
       // button.setTitle("Show status", for: .normal)
       // button.setTitleColor(.white, for: .normal)
       // button.addTarget(self, action: #selector(statusButtonPressed), for: .touchUpInside)
     
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
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        addSubview(avatarImageView)
        
        addSubview(showStatusButton)
        addSubview(stackView)
        
        
        setupContraints()
    
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
        
        avatarImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
            make.width.height.equalTo(120)
        }
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(120)
        }
        showStatusButton.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(42)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(30)
        }
    }
    
}
