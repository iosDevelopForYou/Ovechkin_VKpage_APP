//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Marat Guseynov on 20.02.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var userImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 130, height: 130))
        imageView.image = UIImage(imageLiteralResourceName: "ovechkin")
        imageView.layer.cornerRadius = imageView.frame.width/2
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var profileNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Alexandr Ovechkin"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private lazy var setStatusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(setStatusButtonDidClick(_:)), for: .touchUpInside)
        button.addTarget(self, action: #selector(touchDown), for: .touchDown)
        button.addTarget(self, action: #selector(touchUp), for: .touchUpInside)
        return button
    }()
    
    var placeholderText = "Waiting for something..."
    
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.borderStyle = .roundedRect
        textField.tintColor = .white
        textField.textColor = .gray
        textField.backgroundColor = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Waiting for something"
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .systemBlue
        return label
    }()
    
    private let subAvatarView: UIView = {
        let subImageView = UIView()
        subImageView.translatesAutoresizingMaskIntoConstraints = false
        subImageView.backgroundColor = .black
        subImageView.alpha = 0.3
        subImageView.frame = UIScreen.main.bounds
        return subImageView
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .systemBlue
        button.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var topUserImage = NSLayoutConstraint()
    private var widthUserImage = NSLayoutConstraint()
    private var leadingUserImage = NSLayoutConstraint()
    private var heightUserImage = NSLayoutConstraint()
    
    func setupView() {
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(userImageView)
        addSubview(profileNameLabel)
        addSubview(setStatusButton)
        
        topUserImage = userImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16)
        leadingUserImage = userImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16)
        widthUserImage = userImageView.widthAnchor.constraint(equalToConstant: 130)
        heightUserImage = userImageView.heightAnchor.constraint(equalToConstant: 130)
        
        NSLayoutConstraint.activate([
            topUserImage, leadingUserImage, widthUserImage, heightUserImage,
            
            profileNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            profileNameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 25),
            
            setStatusButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 160),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            
            statusTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 98),
            statusTextField.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 25),
            statusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            statusLabel.bottomAnchor.constraint(equalTo: statusTextField.topAnchor, constant: -8),
            statusLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 171),
            statusLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
    }
    
    @objc func setStatusButtonDidClick(_ sender: UIButton) {
        guard let textFieldText = statusTextField.text else {
            return
        }
        if textFieldText.isEmpty {
            shakeAnimationStatusTexfield()
            statusLabel.textColor = .red
            statusLabel.text = "Set status"
        } else {
            statusLabel.textColor = .systemBlue
            statusLabel.text = statusTextField.text
        }
    }
    
    private func shakeAnimationStatusTexfield() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 2
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: statusTextField.center.x - 10, y: statusTextField.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: statusTextField.center.x + 10, y: statusTextField.center.y))
        statusTextField.layer.add(animation, forKey: "position")
    }
    
    @objc func touchDown() {
        UIView.animate(withDuration: 0.5) {
            self.setStatusButton.setTitle("", for: .normal)
            self.setStatusButton.alpha = 0.4
        }
    }
    
    @objc func touchUp() {
        UIView.animate(withDuration: 0.5) {
            self.setStatusButton.alpha = 1.0
            self.setStatusButton.setTitle("Set status", for: .normal)
        }
    }
    
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        userImageView.isUserInteractionEnabled = true
        userImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapAction() {
        addSubview(subAvatarView)
        addSubview(closeButton)
        bringSubviewToFront(userImageView)
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
            self.subAvatarView.alpha = 0.8
            self.userImageView.layer.cornerRadius = 0
            self.topUserImage.constant = 100
            self.leadingUserImage.constant = 0
            
            self.widthUserImage.constant = UIScreen.main.bounds.width
            self.heightUserImage.constant = UIScreen.main.bounds.width
            self.layoutIfNeeded()
            
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.closeButton.alpha = 1
            }
        }
    }
    
    @objc private func closeAction() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) {
            self.closeButton.alpha = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
                self.userImageView.layer.cornerRadius = 65
                self.topUserImage.constant = 16
                self.leadingUserImage.constant = 16
                self.widthUserImage.constant = 130
                self.heightUserImage.constant = 130
                self.subAvatarView.alpha = 0
                self.layoutIfNeeded()
            }
        }
    }
}

