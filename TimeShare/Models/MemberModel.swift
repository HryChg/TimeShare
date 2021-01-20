//
//  Member.swift
//  TimeShare
//
//  Created by Harry Chuang on 1/17/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import Foundation
import UIKit

struct MemberModel {
    let name: String
    let avatarURL: String
    var avatar: UIImage? {
        return UIImage(named: avatarURL)
    }
    let goal: String // TODO Extract Goal to its own struct
}
