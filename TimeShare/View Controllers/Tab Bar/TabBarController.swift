//
//  TabBarController.swift
//  TimeShare
//
//  Created by Bo LeGrand on 1/28/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import UIKit
import FirebaseAuth

class TabBarController: UITabBarController {
    
    let name = Auth.auth().currentUser?.displayName
    let email = Auth.auth().currentUser?.email
    let displayName = Auth.auth().currentUser?.displayName
    let profileImageURL = Auth.auth().currentUser?.photoURL
    
    let manager = APIManager()
    var json: [String: Any] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    private func addUser() {
        json =  [
        "userID" : email!,
        "name" : displayName!,
        "avatarURL" : profileImageURL!.absoluteString,
        "goal" : ""
        ]

        manager.postRequest(to: K.Paths.users, with: json)
    }
    
    
}
