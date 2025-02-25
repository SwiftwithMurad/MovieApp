//
//  LoginController.swift
//  MovieApp
//
//  Created by Mac on 20.02.25.
//

import UIKit

class LoginVC: UIViewController {
    private let viewModel = LoginViewModel()

    private lazy var logoLabel: UILabel = {
        let label = UILabel()
        label.text = "DocuFlex"
        label.textColor = .black
        label.font = .systemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var signInLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign In"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = .black
        label.font = .systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter your email"
        field.borderStyle = .roundedRect
        field.layer.cornerRadius = 20
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = .black
        label.font = .systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "********"
        field.borderStyle = .roundedRect
        field.layer.cornerRadius = 20
        field.isSecureTextEntry = true
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var repairPassword: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot Password ?", for: .normal)
        button.tintColor = .systemPurple
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .light)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Next", for: .normal)
        button.backgroundColor = .purple
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .light)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var orLabel: UILabel = {
        let label = UILabel()
        label.text = "Or"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var appleButton: UIButton = {
        let button = UIButton(type: .custom)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 0.4
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("Continue with Apple", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        let image = UIImage(named: "appleLogo")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var googleButton: UIButton = {
        let button = UIButton(type: .custom)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 0.4
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("Continue with Google", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        let image = UIImage(named: "googleLogo")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var facebookButton: UIButton = {
        let button = UIButton(type: .custom)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 0.4
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("Continue with Facebook", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        let image = UIImage(named: "facebookLogo")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var createButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create a account", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureConstraints()
    }
    
    @objc func buttonTapped() {
        viewModel.config(email: emailField.text ?? "", password: passwordField.text ?? "")
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
    }
    
    func configureConstraints() {
        view.addSubview(logoLabel)
        view.addSubview(signInLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordField)
        view.addSubview(repairPassword)
        view.addSubview(nextButton)
        view.addSubview(orLabel)
        view.addSubview(appleButton)
        view.addSubview(googleButton)
        view.addSubview(facebookButton)
        view.addSubview(createButton)
        NSLayoutConstraint.activate([
            logoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28),
            logoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInLabel.topAnchor.constraint(equalTo: logoLabel.bottomAnchor, constant: 32),
            signInLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            emailLabel.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 12),
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            emailField.heightAnchor.constraint(equalToConstant: 50),
            emailField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordLabel.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 12),
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            passwordField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 20),
            repairPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            repairPassword.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 16),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            nextButton.topAnchor.constraint(equalTo: repairPassword.bottomAnchor, constant: 16),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            orLabel.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 28),
            orLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            appleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            appleButton.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 16),
            appleButton.heightAnchor.constraint(equalToConstant: 50),
            googleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            googleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            googleButton.topAnchor.constraint(equalTo: appleButton.bottomAnchor, constant: 16),
            googleButton.heightAnchor.constraint(equalToConstant: 50),
            facebookButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            facebookButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            facebookButton.topAnchor.constraint(equalTo: googleButton.bottomAnchor, constant: 16),
            facebookButton.heightAnchor.constraint(equalToConstant: 50),
            createButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            createButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            createButton.topAnchor.constraint(equalTo: facebookButton.bottomAnchor, constant: 16)
        ])
    }
}
