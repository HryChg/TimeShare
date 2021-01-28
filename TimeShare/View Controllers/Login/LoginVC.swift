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
    
    let userDefaults = UserDefaults()
    
    let button = GIDSignInButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //In the view controller, override the viewDidLoad method to set the presenting view controller of the GIDSignIn object, and (optionally) to sign in silently when possible.
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        if userDefaults.bool(forKey: K.UserDefaults.loggedIn) {
            loginToTimeShare()
        }
        
        
        
        view.addSubview(button)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.center = view.center
        
    }
    
    private func loginToTimeShare() {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = mainStoryboard.instantiateViewController(withIdentifier: K.Controller.tabBarController) as? TabBarController {
            
            UIApplication.shared.windows.first?.rootViewController = viewController
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
    }
    
    
}

