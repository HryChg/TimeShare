//
//  RankingCell.swift
//  TimeShare
//
//  Created by Sean Murphy on 1/26/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import UIKit

class RankingCell: UITableViewCell {
    
    static let identifier = "RankingCell"

    @IBOutlet weak var rankingProfilePic: UIImageView!
    @IBOutlet weak var trophyRankingPic: UIImageView!
    @IBOutlet weak var rankingStatsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        rankingStatsLabel.text = "this is a test"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
