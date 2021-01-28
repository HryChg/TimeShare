//
//  LoginVC.swift
//  TimeShare
//
//  Created by Bo LeGrand on 1/27/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import UIKit
import GoogleSignIn

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance()?.presentingViewController = self

    }
    
//    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
//      withError error: NSError!) {
//        if (error == nil) {
//          // Perform any operations on signed in user here.
//          // ...
//        } else {
//          println("\(error.localizedDescription)")
//        }
//    }
    

}
