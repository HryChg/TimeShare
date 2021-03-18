//
//  LoginVC.swift
//  TimeShare
//
//  Created by Bo LeGrand on 1/27/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import TransitionButton

class LoginVC: CustomTransitionViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBOutlet weak var appNameLabel: UILabel!
    
    let userDefaults = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        //        getJSON()
        
        signInButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor(named: K.BrandColors.color4)?.cgColor, UIColor(named: K.BrandColors.color6)?.cgColor,]
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        //In the view controller, override the viewDidLoad method to set the presenting view controller of the GIDSignIn object, and (optionally) to sign in silently when possible.
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        if userDefaults.bool(forKey: K.UserDefaults.loggedIn) {
            loginToTimeShare()
        }
        
    }
    
    @objc private func didTapSignInButton() {
        startSpinner()
    }
    
    func startSpinner() {
        showSpinner(onView: view)
    }
    
    func endSpinner() {
        stopSpinner()
    }
    
    
    
    private func loginToTimeShare() {
                
        endSpinner()
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = mainStoryboard.instantiateViewController(withIdentifier: K.Controller.tabBarController) as? TabBarController {
            
            UIApplication.shared.windows.first?.rootViewController = viewController
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }

    }
    
    
    
    
}

