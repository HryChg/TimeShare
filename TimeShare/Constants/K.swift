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
        static let roomDetailMemberCell = "RoomDetailMemberCell"
    }
    
    struct Images {
        static let addButton = "Add Button"
    }
    
    struct Segue {
        static let goToCreateRoom = "CreateRoomSegue"
        static let goToRoomDetail = "RoomDetailSegue"
        static let createRoomToTimer = "CreateRoomToTimerSegue"
        static let roomDetailToTimer = "RoomDetailToTimerSegue"
    }
}
