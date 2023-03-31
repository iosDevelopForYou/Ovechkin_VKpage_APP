//
//  LogInViewController.swift
//  Navigation
//
//  Created by Marat Guseynov on 01.03.2023.
//

import UIKit

class LogInViewController: UIViewController {
    
    private let notification = NotificationCenter.default
    private let userLogin = "ovechkin"
    private let userPassword = "number8"
    private let passwordMinimumLenth = 7
    private let loginMinimumLenth = 8
    
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
        textField.addTarget(self,action: #selector(self.textFieldDidChange(_:)),for: UIControl.Event.editingChanged)
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
        textField.addTarget(self,action: #selector(self.textFieldDidChange(_:)),for: UIControl.Event.editingChanged)
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
        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        button.addTarget(self, action: #selector(touchDown), for: .touchDown)
        button.addTarget(self, action: #selector(touchUp), for: .touchUpInside)
        return button
    }()
    
    private let logoView: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "logo.png")
        return logo
    }()
    
    private var messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    @objc func touchDown() {
        UIView.animate(withDuration: 0.5) {
            self.loginButton.setTitle("", for: .normal)
            self.loginButton.alpha = 0.4
        }
    }
    
    @objc func touchUp() {
        UIView.animate(withDuration: 0.5) {
            self.loginButton.alpha = 1.0
            self.loginButton.setTitle("Log in", for: .normal)
        }
    }
    
    @objc func loginButtonPressed() {
        guard let username = loginTextField.text, let password = passwordTextField.text else {
            return
        }
        
        if username.isEmpty {
            shakeAnimationLoginTextField()
            messageLabel.text = ""
        }
        if password.isEmpty == true {
            shakeAnimationPasswordTextField()
            messageLabel.text = ""
            
        } else {
            if username == userLogin && password == userPassword {
                let profileVC = ProfileViewController()
                navigationController?.pushViewController(profileVC, animated: true)
            } else {
                let alert = UIAlertController(title: "Error", message: "Incorrect username or password", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            }
        }
    }
    
    private func shakeAnimationLoginTextField() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 2
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: loginTextField.center.x - 10, y: loginTextField.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: loginTextField.center.x + 10, y: loginTextField.center.y))
        
        loginTextField.layer.add(animation, forKey: "position")
    }
    
    private func shakeAnimationPasswordTextField() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 2
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: passwordTextField.center.x - 10, y: passwordTextField.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: passwordTextField.center.x + 10, y: passwordTextField.center.y))
        
        passwordTextField.layer.add(animation, forKey: "position")
    }
    
    private func checkCountOfSymbolsLogin() {
        let login = loginTextField.text
        
        if login!.count < loginMinimumLenth {
            messageLabel.text = "Not enough characters in login"
            messageLabel.textColor = .systemBlue
        }
        if  login!.count == loginMinimumLenth {
            messageLabel.text = "Complete"
            messageLabel.textColor = .green
        }
        if  login!.count > loginMinimumLenth {
            messageLabel.text = "Too much characters in login"
            messageLabel.textColor = .red
        }
    }
    
    private func  checkCountOfSymbolsPassword() {
        let password = passwordTextField.text
        
        if password!.count < passwordMinimumLenth {
            messageLabel.text = "Not enough characters in password"
            messageLabel.textColor = .systemBlue
        }
        if  password!.count == passwordMinimumLenth {
            messageLabel.text = "Complete"
            messageLabel.textColor = .green
        }
        if  password!.count > passwordMinimumLenth {
            messageLabel.text = "Too much characters in password"
            messageLabel.textColor = .red
        }
    }
    
    private func layout() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoView)
        contentView.addSubview(textFieldStackView)
        contentView.addSubview(loginButton)
        contentView.addSubview(messageLabel)
        textFieldStackView.addArrangedSubview(loginTextField)
        textFieldStackView.addArrangedSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
            messageLabel.bottomAnchor.constraint(equalTo: textFieldStackView.topAnchor, constant: -16),
            messageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            messageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
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
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        if textField == loginTextField {
            checkCountOfSymbolsLogin()
        } else {
            checkCountOfSymbolsPassword()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = false
        layout()
    }
}

extension LogInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let login = loginTextField.text
        let password = passwordTextField.text
        
        if login!.isEmpty {
            messageLabel.text = ""
            shakeAnimationLoginTextField()
        } else {
            if password == userPassword && login == userLogin {
                rightData(message: "Password & Login succes, click Log in button to go to profile")
            }
            if login == userLogin && password != userPassword || ((password?.isEmpty) != nil) {
                loginDonePasswordEmty()
            }
            if  login != userLogin {
                wrongData(message: "Login fail")
            }
        }
        
        if password!.isEmpty {
            messageLabel.text = ""
            shakeAnimationPasswordTextField()
        } else {
            if password == userPassword && login == userLogin {
                rightData(message: "Password & Login succes, click Log in button to go to profile")
            }
            if password == userPassword && login != userLogin || ((login?.isEmpty) != nil) {
                passwordDoneLoginEmpty()
            }
            if  password != userPassword {
                wrongData(message: "Password fail")
            }
        }
        
        view.endEditing(true)
        return true
    }
}


