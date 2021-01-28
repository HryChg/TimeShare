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
    }
    
    struct Images {
        static let addButton = "Add Button"
    }
    
    struct Segue {
        static let goToCreateRoom = "CreateRoomSegue"
        static let goToTimer = "TimerSegue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
    
    struct BrandColors {
        static let color1 = "Brand Color 1 CatskillWhite"
        static let color2 = "Brand Color 2 Mystic"
        static let color3 = "Brand Color 3 Capser"
        static let color4 = "Brand Color 4 Gull Gray"
        static let color5 = "Brand Color 5 Fiord"
        static let color6 = "Brand Color 6 Blue Zodiac"
        
    }
    
    struct Controller {
        static let tabBarController = "TabBarController"
        static let loginVC = "LoginVC"
    }
    
    struct UserDefaults {
        static let loggedIn = "LoggedIn"
    }
}
