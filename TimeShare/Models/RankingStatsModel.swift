//
//  RankingStatsModel.swift
//  TimeShare
//
//  Created by Sean Murphy on 1/24/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import Foundation
import UIKit

struct RankingStatsModel {
    let name: String
    let avatarURL: String
    var avatar: UIImage? {
        return UIImage(named: avatarURL)
    }
//    let 
    let statCategories: [String]
    let statTalliedTotals: [String]
    
}
