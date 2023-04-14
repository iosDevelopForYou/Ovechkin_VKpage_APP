//
//  FeedViewController.swift
//  Navigation
//
//  Created by Marat Guseynov on 16.02.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post = Post(title: "Post Here")
    
    private let verticalStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private let postViewButton1: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Make Post", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        return button
    }()
    
    private let postViewButton2: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Make Post", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray3
        navigationItem.title = "Post"
        setupButton()
        setConstraints()
        
    }
    private func setupButton() {
        view.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(postViewButton1)
        verticalStackView.addArrangedSubview(postViewButton2)
      
        postViewButton1.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        postViewButton2.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        
    }
    
    @objc private func tapAction() {
        let postVC = PostViewController()
        self.navigationController?.pushViewController(postVC, animated: true)
        postVC.titlePost = post.title
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
    }
}
