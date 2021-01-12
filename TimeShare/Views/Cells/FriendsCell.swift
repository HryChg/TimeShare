//
//  FriendsCell.swift
//  TimeShare
//
//  Created by Bo LeGrand on 1/12/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import UIKit

class FriendsCell: UICollectionViewCell {
    
    static let identifier = "FriendsCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
                
    }
    
}

extension UIImageView {

    func makeRound() {
        layer.cornerRadius = (frame.width / 2)
        layer.masksToBounds = true
    }
}
