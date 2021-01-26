//
//  K.swift
//  TimeShare
//
//  Created by Bo LeGrand on 1/11/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import Foundation



struct K {
    struct Cell {
        static let roomIdentifier = "RoomCell"
        static let memberIdentifier = "MemberCell"
        static let rankingCellNibName = "RankingNib"
        static let rankingSpecificsNibName = "RankingSpecifics"
        static let rankingCellIdentifier = "RankingOrderedCell"
        static let rankingStatsCellIdentifier = "RankingStatsCell"
    }
    
    struct Images {
        static let addButton = "Add Button"
    }
    
    struct Segue {
        static let goToCreateRoom = "CreateRoomSegue"
        static let goToTimer = "TimerSegue"
        static let goToPersonalStats = "goToPersonalStats"
    }
}
