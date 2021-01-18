//
//  RoomCell.swift
//  TimeShare
//
//  Created by Harry Chuang on 1/18/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import UIKit

class RoomCell: UITableViewCell {

    @IBOutlet weak var roomTitleLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var remainingTimeLabel: UILabel!
    @IBOutlet weak var memberCountLabel: UILabel!
    @IBOutlet weak var imageStackView: UIStackView!
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
