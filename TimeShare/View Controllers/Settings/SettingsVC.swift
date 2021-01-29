//
//  SettingsViewController.swift
//  TimeShare
//
//  Created by Bo LeGrand on 1/11/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import UIKit
import FirebaseAuth
import TransitionButton

class SettingsVC: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let logoutButton: TransitionButton = {
        let button = TransitionButton()
        
        button.setTitle("Logout", for: .normal)
        button.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        
        
        return button
    }()
    
    static let identifier = "SettingsVC"
    
    let settingsItems = [
    
        SettingsItem(name: "Profile", image: UIImage(named: "Profile")),
        SettingsItem(name: "Friends", image: UIImage(named: "Friends")),
        SettingsItem(name: "Timezone", image: UIImage(named: "Timezone")),
        SettingsItem(name: "About", image: UIImage(named: "About")),
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupUI()

    }

    private func setupUI() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Settings"
        
        view.addSubview(logoutButton)
        

        logoutButton.backgroundColor = UIColor(named: K.BrandColors.color6)
        logoutButton.setTitleColor(.white, for: .normal)
        logoutButton.layer.cornerRadius = 15
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
   
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200).isActive = true
        logoutButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        logoutButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setupCollectionView() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let screenWidth = UIScreen.main.bounds.width
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 50
        layout.itemSize = CGSize(width: screenWidth / 3, height: screenWidth / 4)
        layout.sectionInset = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
    
        collectionView.collectionViewLayout = layout
                
    }
    
    private func goToLoginVC() {
        
        logoutButton.stopAnimation(animationStyle: .expand, revertAfterDelay: 1) {
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            if let viewController = mainStoryboard.instantiateViewController(withIdentifier: K.Controller.loginVC) as? LoginVC {
                
                UIApplication.shared.windows.first?.rootViewController = viewController
                UIApplication.shared.windows.first?.makeKeyAndVisible()
                
            }
        }
        
    }
    
    @objc func logoutButtonTapped() {
        
        logoutButton.startAnimation()
        
        let alert = UIAlertController(title: "Are you sure you want to sign out?", message: "", preferredStyle: .actionSheet)
        
        let action = UIAlertAction(title: "Sign out", style: .destructive) { [self] (action) in
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
            
            
            let userDefaults = UserDefaults()
            userDefaults.setValue(false, forKey: K.UserDefaults.loggedIn)
            
            goToLoginVC()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { [self] (cancel) in
            logoutButton.stopAnimation(animationStyle: .normal, revertAfterDelay: 0) {
                logoutButton.layer.cornerRadius = 15

            }
        }
        
        alert.addAction(action)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
        
    }
        
}

extension SettingsVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return settingsItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SettingsCell.identifier, for: indexPath) as? SettingsCell else { return UICollectionViewCell() }
        

        let items = settingsItems[indexPath.item]
        
        let viewModel = SettingsViewModel(name: items.name, image: items.image)

        cell.nameLabel.text = viewModel.name
        cell.imageView.image = viewModel.image
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.item {
        case 0:
            if let vc = storyboard?.instantiateViewController(withIdentifier: ProfileVC.identifier) as? ProfileVC {
                navigationController?.pushViewController(vc, animated: true)
            }
        case 1:
            if let vc = storyboard?.instantiateViewController(withIdentifier: FriendsVC.identifier) as? FriendsVC {
                navigationController?.pushViewController(vc, animated: true)
            }
        case 2:
            if let vc = storyboard?.instantiateViewController(withIdentifier: TimezoneVC.identifier) as? TimezoneVC {
                navigationController?.pushViewController(vc, animated: true)
            }
        case 3:
            if let vc = storyboard?.instantiateViewController(withIdentifier: AboutVC.identifier) as? AboutVC {
                navigationController?.pushViewController(vc, animated: true)
            }
            
        default:
            break
        }
        
    }
    
}
