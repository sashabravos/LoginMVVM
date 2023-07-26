//
//  LoginViewController.swift
//  JustChat
//
//  Created by Александра Кострова on 21.06.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    var loginViewModel = LoginViewModel()
    
    private let pageTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 40.0, weight: .medium)
        label.textColor = .label
        label.text = "Login"
        return label
    }()

    private let statusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .regular)
        label.text = ""
        return label
    }()
    
    private let loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Login"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel!.numberOfLines = 0
        button.setTitle("Register", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        bindViewModel()
    }
    
    // MARK: - UI Configuration
    
    private func configureUI() {
        view.backgroundColor = .white

        [pageTitle,loginTextField, passwordTextField, loginButton, statusLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            pageTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            
            loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTextField.topAnchor.constraint(equalTo: pageTitle.bottomAnchor, constant: 20),
                loginTextField.widthAnchor.constraint(equalToConstant: 200),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalToConstant: 200),
            
            loginButton.widthAnchor.constraint(equalTo: passwordTextField.widthAnchor, constant: -10),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            statusLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20)
        ])
    }
    
    // MARK: - Actions
    
    @objc private func registerButtonTapped() {
        loginViewModel.loginButtonPressed(login: (loginTextField.text ?? ""), password: (passwordTextField.text ?? ""))
    }
    
    func bindViewModel() {
        loginViewModel.statusText.bind ({ (statusText) in
            DispatchQueue.main.async {
                self.statusLabel.text = statusText
            }
        })
        loginViewModel.statusColor.bind ({ (statusColor) in
            DispatchQueue.main.async {
                self.statusLabel.textColor = statusColor
            }
        })
    }
}



