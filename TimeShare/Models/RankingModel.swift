//
//  RankingModel.swift
//  TimeShare
//
//  Created by Sean Murphy on 1/24/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import Foundation
import UIKit

struct RankingModel {
    let name: String
    let avatarURL: String
    var avatar: UIImage? {
        return UIImage(named: avatarURL)
    }
    
}
