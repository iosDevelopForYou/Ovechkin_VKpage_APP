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
    
    private lazy var statusShowButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    let placeholderText = "Waiting for something..."
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = placeholderText
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .gray
        textField.backgroundColor = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(statusTextField)
        addSubview(userImageView)
        addSubview(profileNameLabel)
        addSubview(statusShowButton)
        
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            userImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            userImageView.widthAnchor.constraint(equalToConstant: 130),
            userImageView.heightAnchor.constraint(equalToConstant: 130),
            
            profileNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            profileNameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 25),
            
            statusShowButton.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 16),
            statusShowButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            statusShowButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusShowButton.heightAnchor.constraint(equalToConstant: 50),
            
            statusTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 98),
            statusTextField.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 25),
        ])
        
    }
    
    @objc func buttonPressed() {
        print(placeholderText)
    }
}

