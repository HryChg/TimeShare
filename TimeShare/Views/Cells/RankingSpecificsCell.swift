//
//  RankingSpecificsCell.swift
//  TimeShare
//
//  Created by Sean Murphy on 1/18/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import UIKit

class RankingSpecificsCell: UITableViewCell {
    
    static let identifier = ""

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var statsLabel: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
