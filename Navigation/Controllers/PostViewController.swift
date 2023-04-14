//
//  PostViewController.swift
//  Navigation
//
//  Created by Marat Guseynov on 17.02.2023.
//

import UIKit

class PostViewController: UIViewController {
    
    var titlePost = "Post Here"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = titlePost
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapAction))
    }
    
    @objc private func tapAction() {
        let infoVC = InfoViewController()
        present(infoVC, animated: true)
        
    }
}
