//
//  SettingsViewController.swift
//  TimeShare
//
//  Created by Bo LeGrand on 1/11/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
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
        
    }
    
    private func setupCollectionView() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
                
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

extension SettingsVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenWidth = UIScreen.main.bounds.width
        
        return CGSize(width: screenWidth / 3, height: screenWidth / 4)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }
    
}
