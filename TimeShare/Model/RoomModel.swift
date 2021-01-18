//
//  RoomModel.swift
//  TimeShare
//
//  Created by Harry Chuang on 1/17/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import Foundation

struct RoomModel {
    let uuid = UUID()
    let title: String
    let timer: Int
    let timeLeft: Double
    let members = [MemberModel]()
    var progress: Double {
        return Double(timer) / timeLeft
    }
}
