//
//  LogInViewController.swift
//  Navigation
//
//  Created by Marat Guseynov on 01.03.2023.
//

import UIKit

class LogInViewController: UIViewController {
    
    private let notification = NotificationCenter.default
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.clipsToBounds = true
        return contentView
    }()
    
    private let textFieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.layer.cornerRadius = 10
        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = colorGrey.cgColor
        stackView.layer.masksToBounds = true
        stackView.backgroundColor = .systemGray6
        return stackView
    }()
    
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email"
        textField.textColor = .black
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = colorGrey.cgColor
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.tintColor = colorSet
        textField.delegate = self
        textField.autocapitalizationType = .none
        textField.setLeftPaddingPoints(10)
        textField.setRightPaddingPoints(10)
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.textColor = .black
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = colorGrey.cgColor
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.tintColor = colorSet
        textField.isSecureTextEntry = true
        textField.delegate = self
        textField.setLeftPaddingPoints(10)
        textField.setRightPaddingPoints(10)
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log in", for: .normal)
        button.backgroundColor = bluePixelColor
        button.layer.cornerRadius = 10
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.addTarget(self, action: #selector(goToProfileView), for: .touchUpInside)
        return button
    }()
    
    private let logoView: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "logo.png")
        return logo
    }()
    
    @objc func goToProfileView() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    func checkLoginButtonStates() {
        switch loginButton.state {
        case .normal: loginButton.alpha = 1
        case .selected: loginButton.alpha = 0.8
        case .highlighted: loginButton.alpha = 0.8
        case .disabled: loginButton.alpha = 0.8
        default:
            break
        }
    }
    
    private func layout() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoView)
        contentView.addSubview(textFieldStackView)
        contentView.addSubview(loginButton)
        textFieldStackView.addArrangedSubview(loginTextField)
        textFieldStackView.addArrangedSubview(passwordTextField)
        
        checkLoginButtonStates()
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            logoView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoView.heightAnchor.constraint(equalToConstant: 100),
            logoView.widthAnchor.constraint(equalToConstant: 100),
            logoView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 120),
            
            textFieldStackView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 120),
            textFieldStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textFieldStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.topAnchor.constraint(equalTo: textFieldStackView.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notification.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notification.removeObserver(UIResponder.keyboardWillShowNotification)
        notification.removeObserver(UIResponder.keyboardWillHideNotification)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyBoardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyBoardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyBoardSize.height, right: 0)
        }
    }
    
    @objc private func keyboardWillHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = false
        layout()
    }
}
extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ loginTextField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
