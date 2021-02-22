//
//  ProfileVC.swift
//  TimeShare
//
//  Created by Bo LeGrand on 1/12/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import UIKit
import FirebaseAuth

class ProfileVC: UIViewController {
    
    static let identifier = "ProfileVC"
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var displayNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var displayNameTitleLabel: UILabel!
    @IBOutlet weak var emailTitleLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    
    let name = Auth.auth().currentUser?.displayName
    let email = Auth.auth().currentUser?.email
    let displayName = Auth.auth().currentUser?.displayName
    let profileImageURL = Auth.auth().currentUser?.photoURL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    private func setupUI() {
        
        title = "Profile"
        
        view.backgroundColor = UIColor(named: K.BrandColors.color2)
        
        profileImageView.downloaded(from: profileImageURL!)
        profileImageView.makeRound()
        
        displayNameLabel.text = displayName
        emailLabel.text = email
        
        displayNameTitleLabel.text = "Display Name"
        emailTitleLabel.text = "Email"
        
        editButton.setTitle("Edit Display Name", for: .normal)
        editButton.setTitleColor(.white, for: .normal)
        editButton.backgroundColor = UIColor(named: K.BrandColors.color6)
        editButton.layer.cornerRadius = 15
        
    }
    
    @IBAction func editDisplayNameButtonTapped(_ sender: UIButton) {
        
        showAlertWithTextField(title: "Change Display Name",
                               message: "This is what others will see",
                               textFieldPlaceholder: "New Display Name") { (text) in
            
            if let text = text {
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = text
                changeRequest?.commitChanges { (error) in
                    if let e = error {
                        print("Error changing display name \(e.localizedDescription)")
                    } else {
                        self.displayNameLabel.text = text
                    }
                }
            }
        }
    }
    
}

extension UIImageView {
    
    func makeRound() {
        
        layer.masksToBounds = true
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

extension UIViewController {
    
    func showAlertWithTextField(title: String, message: String, textFieldPlaceholder: String, completion: @escaping (String?)->()) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { _ -> Void in
            let textField = alertController.textFields![0] as UITextField
            completion(textField.text)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        alertController.addTextField { (textField: UITextField!) -> Void in
            textField.placeholder = textFieldPlaceholder
            completion(nil)
        }
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
}
