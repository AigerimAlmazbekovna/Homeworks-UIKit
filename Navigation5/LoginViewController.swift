//
//  LoginViewController.swift
//  Navigation5
//
//  Created by Айгерим on 31.03.2024.
//

import UIKit

final class LoginViewController: UIViewController {
    
    var loginDelegate: LoginViewControllerDelegate?
    
    var bruteForce = BruteForce()
    // MARK: Visual content
    
    var loginScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var vkLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var loginStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.layer.borderColor = UIColor.gray.cgColor
        stack.layer.borderWidth = 0.5
        stack.layer.cornerRadius = 12
        stack.distribution = .fillProportionally
        stack.backgroundColor = .systemGray6
        stack.clipsToBounds = true
        return stack
    }()
    //Замените для всех экранов стандартные UIButton на вашу собственную CustomButton там, где это целесообразно. Обратите внимание, насколько ваш исходный код стал компактнее и яснее.
   private lazy var loginButton: CustomButton = {
        let button = CustomButton(title: "Log In", titleColor: .white) { [weak self] in
                        self?.touchLoginButton()
            
        }
       // button.translatesAutoresizingMaskIntoConstraints = false
     
       // button.backgroundColor = Theme.currentColor.backroundColor
       // button.setTitle("Log In", for: .normal)
       // button.setTitleColor(.white, for: .normal)
       // button.addTarget(nil, action: #selector(touchLoginButton), for: .touchUpInside)
       // button.layer.cornerRadius = 12
       // button.clipsToBounds = true
        return button
    }()
    
    private lazy var getPassword: CustomButton = {
            let button = CustomButton(title: "Подобрать пароль", titleColor: .white) { [weak self] in
                self?.bruteForceAction()
            }
            return button
        }()
        
    let activityIndicator: UIActivityIndicatorView = {
            let indicator = UIActivityIndicatorView(style: .medium)
            indicator.translatesAutoresizingMaskIntoConstraints = false
            
            return indicator
        }()
        
    var loginField: UITextField = {
        let login = UITextField()
        login.translatesAutoresizingMaskIntoConstraints = false
        login.placeholder = "Email or phone"
        login.layer.borderWidth = 0.5
        login.leftViewMode = .always
        login.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: login.frame.height))
        login.keyboardType = .emailAddress
        login.textColor = .black
        login.font = UIFont.systemFont(ofSize: 16)
        login.autocapitalizationType = .none
        login.returnKeyType = .done
        
        //Autofill login for Debug and Release
                #if DEBUG
                login.text = "Test"
                #else
                login.text = "Kenobi"
                #endif
        
        return login
    }()
    
    var passwordField: UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.leftViewMode = .always
        password.placeholder = "Password"
        password.layer.borderWidth = 0.5
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: password.frame.height))
        password.isSecureTextEntry = true
        password.textColor = .black
        password.font = UIFont.systemFont(ofSize: 16)
        password.autocapitalizationType = .none
        password.returnKeyType = .done
        return password
    }()
    
    // MARK: - Setup section
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(loginScrollView)
        loginScrollView.addSubview(contentView)
        
        contentView.addSubview(vkLogo)
        contentView.addSubview(loginStackView)
        contentView.addSubview(loginButton)
        
        loginStackView.addArrangedSubview(loginField)
        loginStackView.addArrangedSubview(passwordField)
        
        loginField.delegate = self
        passwordField.delegate = self
        
        setupConstraints()
    }
    
    private func bruteForceAction() {
            
            let start = Date()
            
            self.activityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
            passwordField.placeholder = ""
            
            
            DispatchQueue.global(qos: .utility).async {
                let password = self.bruteForce.generatePassword()
                
                Checker.shared.userPassword = password
                
                print("Random password: ", password)
                let passwordBruteForce = self.bruteForce.bruteForce(passwordToUnlock: password)
                
                print("Password find: ", passwordBruteForce)
                
                let end = Date()
                
                DispatchQueue.main.async {
                    self.passwordField.text = passwordBruteForce
                    self.passwordField.isSecureTextEntry = false
                    self.activityIndicator.isHidden = true
                    self.activityIndicator.stopAnimating()
                }
                
                let findTime = end.timeIntervalSince(start)
                print("Password finding time: \(findTime)")
            }
        }
    
    
    private func displayErrorAlert(message: String) {
            let alert = UIAlertController(
                title: "Ошибка",
                message: message,
                preferredStyle: .alert
            )

            let okAction = UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil
            )

            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([

            loginScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            loginScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            loginScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            loginScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: loginScrollView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: loginScrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: loginScrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: loginScrollView.leadingAnchor),
            contentView.centerXAnchor.constraint(equalTo: loginScrollView.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: loginScrollView.centerYAnchor),

            vkLogo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            vkLogo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            vkLogo.heightAnchor.constraint(equalToConstant: 100),
            vkLogo.widthAnchor.constraint(equalToConstant: 100),

            loginStackView.topAnchor.constraint(equalTo: vkLogo.bottomAnchor, constant: 120),
            loginStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginStackView.heightAnchor.constraint(equalToConstant: 100),

            loginButton.topAnchor.constraint(equalTo: loginStackView.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)

    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        let nc = NotificationCenter.default
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
    // MARK: - Event handlers
    
    private func displayErrorAlert() {
        let alert = UIAlertController(
            title: "Ошибка", message: "oшибка",
                    preferredStyle: .alert
                )
        present(alert, animated: true, completion: nil)
    }

   // @objc
   private func touchLoginButton() {
        guard let userLogin = loginField.text, !userLogin.isEmpty else {
              return displayErrorAlert(message: "Введите логин")
          }
          guard let userPassword = passwordField.text, !userPassword.isEmpty else {
              return displayErrorAlert(message: "Введите пароль")
          }
          
          if let validUser = loginDelegate?.check(login: userLogin, password: userPassword) {
              navigateToProfile(user: validUser)
          } else {
              displayErrorAlert(message: "Неверный логин или пароль")
          }
      }

      private func navigateToProfile(user: User) {
          let profileViewController = ProfileViewController(user: user)
          navigationController?.pushViewController(profileViewController, animated: true)
      }

  
    
    @objc private func keyboardShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            loginScrollView.contentOffset.y = keyboardSize.height - (loginScrollView.frame.height - loginButton.frame.minY)
            loginScrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }

    @objc private func keyboardHide(notification: NSNotification) {
        loginScrollView.contentOffset = CGPoint(x: 0, y: 0)
    }
}

// MARK: - Extension

extension LoginViewController: UITextFieldDelegate {
    
    // tap 'done' on the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
