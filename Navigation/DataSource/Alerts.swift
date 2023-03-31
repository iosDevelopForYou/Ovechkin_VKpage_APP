//
//  Alerts.swift
//  Navigation
//
//  Created by Marat Guseynov on 24.03.2023.
//

import Foundation
import UIKit

extension LogInViewController {
    @objc func wrongData(message: String) {
        
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "One more chance", style: .destructive) { (action) -> Void in
            print("Alert")
        }
        
        alertController.addAction(yesAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    @objc func rightData(message: String) {
        
        let alertController = UIAlertController(title: "Good job!", message: message, preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Done", style: .default) { (action) -> Void in
            print("Good job!")
        }
        
        alertController.addAction(yesAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    @objc func loginDonePasswordEmty() {
        
        let alertController = UIAlertController(title: "Oops", message: "Password textfield is empty or wrong, try again", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Go", style: .destructive) { (action) -> Void in
            print("Oops")
        }
        
        alertController.addAction(yesAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    @objc func passwordDoneLoginEmpty() {
        
        let alertController = UIAlertController(title: "Oops", message: "Login textfield is empty or wrong, try again", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Go", style: .destructive) { (action) -> Void in
            print("Oops")
        }
        
        alertController.addAction(yesAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
}
