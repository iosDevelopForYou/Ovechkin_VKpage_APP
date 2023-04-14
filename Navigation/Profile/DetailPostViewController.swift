//
//  DetailPostViewController.swift
//  Navigation
//
//  Created by Marat Guseynov on 29.03.2023.
//

import UIKit

class DetailPostViewController: UIViewController {
    
    lazy var indexPathCell = IndexPath()
    var postModelPushVC: PostModel
    
    private let scrollView: UIScrollView = {
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
    
    private var autorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var myImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .white
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupPushVC(postModelPushVC: PostModel) {
        self.postModelPushVC = postModelPushVC
        autorLabel.text = postModelPushVC.autor
        myImageView.image = postModelPushVC.image
        descriptionLabel.text = postModelPushVC.description
    }
    
    init(postModelPushVC: PostModel) {
        self.postModelPushVC = postModelPushVC
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViewLayout()
        setupPushVC(postModelPushVC: postModelPushVC)
    }
    
    let screenWidth = UIScreen.main.bounds.width
    
    private func addViewLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(autorLabel)
        contentView.addSubview(myImageView)
        contentView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            autorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            autorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            autorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            myImageView.topAnchor.constraint(equalTo: autorLabel.bottomAnchor, constant: 16),
            myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            myImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            myImageView.heightAnchor.constraint(equalToConstant: screenWidth),
            myImageView.widthAnchor.constraint(equalToConstant: screenWidth),
            
            descriptionLabel.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
