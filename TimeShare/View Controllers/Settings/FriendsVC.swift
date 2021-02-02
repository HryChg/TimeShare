//
//  FriendsVC.swift
//  TimeShare
//
//  Created by Bo LeGrand on 1/12/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import UIKit

class FriendsVC: UIViewController {
    
    static let identifier = "FriendsVC"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupCollectionView()
        
    }
    
    private func setupUI() {
        
        title = "Friends"
        
        view.backgroundColor = UIColor(named: K.BrandColors.color2)
        
    }
    
    private func setupCollectionView() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = UIColor(named: K.BrandColors.color2)
        
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
    }
    
}

extension FriendsVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendsCell.identifier, for: indexPath) as? FriendsCell else { return UICollectionViewCell() }
        
        cell.imageView.image = UIImage(named: "Headshot")
        cell.nameLabel.text = "Name"
        
        cell.imageView.makeRound()
        
        return cell
        
    }
    
}

extension FriendsVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 50, left: 0, bottom: 50, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width
        
        return CGSize(width: (width / 3) - 4, height: (width / 3) - 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
