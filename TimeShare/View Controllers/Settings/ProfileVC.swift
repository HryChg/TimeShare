//
//  ProfileVC.swift
//  TimeShare
//
//  Created by Bo LeGrand on 1/12/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    static let identifier = "ProfileVC"
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var firstNameLabel: UILabel!
    
    @IBOutlet weak var lastNameLabel: UILabel!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var firstNameTitleLabel: UILabel!
    
    @IBOutlet weak var lastNameTitleLabel: UILabel!
    
    @IBOutlet weak var userNameTitleLabel: UILabel!
    
    @IBOutlet weak var emailTitleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

    }
    
    private func setupUI() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Profile"
        
        profileImageView.image = UIImage(named: "Headshot")
        profileImageView.makeRound()
        
        firstNameLabel.text = "Jane"
        lastNameLabel.text = "Doe"
        userNameLabel.text = "janedoe"
        emailLabel.text = "janedoe@gmail.com"
        
        firstNameTitleLabel.text = "First Name"
        lastNameTitleLabel.text = "Last Name"
        userNameTitleLabel.text = "Username"
        emailTitleLabel.text = "Email"
        
        editButton.setTitle("Edit", for: .normal)
        editButton.setTitleColor(.white, for: .normal)
        editButton.backgroundColor = UIColor(hexString: "14274E")
        editButton.layer.cornerRadius = 15
        
    }

}
