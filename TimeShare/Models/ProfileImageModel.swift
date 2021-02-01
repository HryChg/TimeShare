//
//  ProfileImageModel.swift
//  TimeShare
//
//  Created by Bo LeGrand on 1/30/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import UIKit
import FirebaseAuth

class ProfileButton: UIBarButtonItem {
    
    let profileImageURL = Auth.auth().currentUser?.photoURL
    
    var profileImage: UIImage?
    let profileImageView = UIImageView()
    
    
    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    public func displayProfileImage() {
        
        getData(from: profileImageURL!) { data, response, error in
            
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async() { [self] in
                 
                profileImage = UIImage(data: data)
                profileImageView.image = UIImage(data: data)
                
                let profileButton = UIButton()
                
                profileButton.setImage(profileImage, for: .normal)
                profileButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
                profileButton.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
                profileButton.layer.cornerRadius = 0.5 * profileButton.bounds.size.width
                profileButton.clipsToBounds = true
                let rightNavBarButton = UIBarButtonItem(customView: profileButton)
                rightNavBarButton.customView?.widthAnchor.constraint(equalToConstant: 40).isActive = true
                rightNavBarButton.customView?.heightAnchor.constraint(equalToConstant: 40).isActive = true
//                navigationItem.rightBarButtonItem = rightNavBarButton
                
            }
        }
    }
    
    @objc private func profileButtonTapped() {
        print("Profile Button Tapped")
    }
    
}

//struct ProfileImageModel {
//
//    let profileImageURL = Auth.auth().currentUser?.photoURL
//
//    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
//        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
//    }
//
//    public func displayProfileImage(navigationItem: UINavigationItem) {
//
//        getData(from: profileImageURL!) { data, response, error in
//            guard let data = data, error == nil else { return }
//            DispatchQueue.main.async() {
//
//                var profileImage: UIImage?
//                let profileImageView = UIImageView()
//
//                profileImage = UIImage(data: data)
//                profileImageView.image = UIImage(data: data)
//
//                let profileButton = UIButton()
//
//                profileButton.setImage(profileImage, for: .normal)
//                profileButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
//                profileButton.addTarget(self, action: #selector(selector), for: .touchUpInside)
//                profileButton.layer.cornerRadius = 0.5 * profileButton.bounds.size.width
//                profileButton.clipsToBounds = true
//                let rightNavBarButton = UIBarButtonItem(customView: profileButton)
//                rightNavBarButton.customView?.widthAnchor.constraint(equalToConstant: 40).isActive = true
//                rightNavBarButton.customView?.heightAnchor.constraint(equalToConstant: 40).isActive = true
//                navigationItem.rightBarButtonItem = rightNavBarButton
//
//            }
//        }
//    }
//}
