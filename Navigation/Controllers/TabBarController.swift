//
//  TabBarViewController.swift
//  Navigation
//
//  Created by Marat Guseynov on 16.02.2023.
//

import UIKit


final class TabBarViewController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        tabBar.backgroundColor = .systemGray4
        
        let feedVC = FeedViewController()
        lazy var profileVC = ProfileViewController() 
        let loginVC = LogInViewController()
        
        let feedNavigation = UINavigationController(rootViewController: feedVC)
        let profileNavigation = UINavigationController(rootViewController: loginVC)
        
        feedNavigation.tabBarItem.title = "Feed"
        feedNavigation.tabBarItem.image = UIImage(systemName: "bubble.right")
        
        profileNavigation.tabBarItem.title = "Profile"
        profileNavigation.tabBarItem.image = UIImage(systemName: "person")
        
        setViewControllers([feedNavigation, profileNavigation], animated: true)
    }
    
}
