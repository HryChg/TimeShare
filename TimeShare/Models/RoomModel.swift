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
    let workTimer: Int
    let breakTimer: Int
    let onBreak = false
    let timeLeft: Double
    var progress: Double {
        return Double(onBreak ? self.breakTimer : self.workTimer) / timeLeft
    }

    // TODO
    // updateTitle
    // updateMembers

    // TODO Possibly Extrate some logic out for the TimerModel
    // updateWorkTimer
    // updateBreakTimer
    // updateOnBreak
    // updateTimeLeft
}
