//
//  ProfileVC.swift
//  TimeShare
//
//  Created by Bo LeGrand on 1/12/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import UIKit
import Firebase

class ProfileVC: UIViewController {
    
    static let identifier = "ProfileVC"
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var firstNameTitleLabel: UILabel!
    @IBOutlet weak var userNameTitleLabel: UILabel!
    @IBOutlet weak var emailTitleLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    
    let name = Auth.auth().currentUser?.displayName
    let email = Auth.auth().currentUser?.email
    let profileImageURL = Auth.auth().currentUser?.photoURL
    
    var profileImage: UIImage?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

    }
    
    private func setupUI() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Profile"
        
        profileImageView.setRounded()
        
        nameLabel.text = name
        userNameLabel.text = "janedoe"
        emailLabel.text = email
        
        firstNameTitleLabel.text = "Name"
        userNameTitleLabel.text = "Display Name"
        emailTitleLabel.text = "Email"
        
        editButton.setTitle("Edit Display Name", for: .normal)
        editButton.setTitleColor(.white, for: .normal)
        editButton.backgroundColor = UIColor(named: K.BrandColors.color6)
        editButton.layer.cornerRadius = 15
                    
    
    
    }
    
    @IBAction func editDisplayNameButtonTapped(_ sender: UIButton) {
        
        
        
    }
    

}

extension UIImageView {

    func makeRounded() {

        layer.masksToBounds = true
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
    }
}

extension UIImageView {

   func setRounded() {
    let radius = frame.width / 2
      self.layer.cornerRadius = radius
      self.layer.masksToBounds = true
   }
}

extension UIImage {
    func resizeImage(_ dimension: CGFloat, opaque: Bool, contentMode:
                        UIView.ContentMode = .scaleAspectFit) -> UIImage {
        var width: CGFloat
        var height: CGFloat
        var newImage: UIImage

        let size = self.size
        let aspectRatio =  size.width/size.height

        switch contentMode {
        case .scaleAspectFit:
            if aspectRatio > 1 {                            // Landscape image
                width = dimension
                height = dimension / aspectRatio
            } else {                                        // Portrait image
                height = dimension
                width = dimension * aspectRatio
            }

        default:
            fatalError("UIIMage.resizeToFit(): FATAL: Unimplemented ContentMode")
        }

        if #available(iOS 10.0, *) {
            let renderFormat = UIGraphicsImageRendererFormat.default()
            renderFormat.opaque = opaque
            let renderer = UIGraphicsImageRenderer(size: CGSize(width: width, height: height), format: renderFormat)
            newImage = renderer.image {
                (context) in
                self.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
            }
        } else {
            UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: height), opaque, 0)
            self.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
            newImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
        }

        return newImage
    }
}
