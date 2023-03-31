//
//  InfoViewController.swift
//  Navigation
//
//  Created by Marat Guseynov on 17.02.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    private let postViewButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Alert Button", for: .normal)
        button.backgroundColor = .orange
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        return button
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        setupButton()
    }
    
    private func setupButton() {
        
        view.addSubview(postViewButton)
        postViewButton.center = view.center
        postViewButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
    }
    
    @objc private func tapAction() {
        
        let alertController = UIAlertController(title: "Alert", message: "Are you okay?", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Yes", style: .default) { (action) -> Void in
            print("The user is okay.")
        }
        
        let noAction = UIAlertAction(title: "No", style: .default) { (action) -> Void in
            print("The user is not okay.")
        }
        
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
