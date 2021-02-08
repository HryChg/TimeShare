//
//  MessageCell.swift
//  TimeShare
//
//  Created by Bo LeGrand on 1/21/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    static let identifier = "MessageCell"

    @IBOutlet weak var bodyLabel: UILabel!
    
    @IBOutlet weak var messageBubble: UIView!
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        messageBubble.layer.cornerRadius = 12
        rightImageView.makeRound()
        leftImageView.makeRound()
        
    }
  
}
