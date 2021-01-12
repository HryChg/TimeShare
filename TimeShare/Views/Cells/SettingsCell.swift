//
//  SettingsCollectionViewCell.swift
//  TimeShare
//
//  Created by Bo LeGrand on 1/11/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import UIKit

class SettingsCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    static let identifier = "SettingsCollectionViewCell"
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.backgroundColor = UIColor(hexString: "14274E")
        nameLabel.textColor = .white
        imageView.tintColor = .white
        contentView.layer.cornerRadius = 10
    }
    
    internal func configure(_ image: UIImage, _ name: String) {
        
        imageView.image = image
        nameLabel.text = name
        
    }
    
}

extension UIColor {
    convenience init?(hexString: String, alpha: CGFloat = 1) {
        var chars = Array(hexString.hasPrefix("#") ? hexString.dropFirst() : hexString[...])
        switch chars.count {
        case 3: chars = chars.flatMap { [$0, $0] }
        case 6: break
        default: return nil
        }
        self.init(red: .init(strtoul(String(chars[0...1]), nil, 16)) / 255,
                green: .init(strtoul(String(chars[2...3]), nil, 16)) / 255,
                 blue: .init(strtoul(String(chars[4...5]), nil, 16)) / 255,
                alpha: alpha)
    }
}
