//
//  RoomJSON.swift
//  TimeShare
//
//  Created by Harry Chuang on 3/26/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

// https://medium.com/@nictheawesome/using-codable-with-nested-objects-is-easier-and-more-fun-than-you-think-8c9edfa29ed7

import Foundation

let json = """
{
  "workTimer": 50,
  "breakTimer": 10,
  "onBreak": false,
  "timeLeft": 50,
  "title": "RoomTitle",
  "userIDs": [
    "vrjgik5"
  ]
}
"""

let data = Data(json.utf8)

struct Room: Codable {
    var workTimer: Float
    var breakTimer: Float
    var onBreak: Bool
    var timeLeft: Float
    var title: String
    var userIDs: [String]

    enum CodingKeys: String, CodingKey {
        case workTimer
        case breakTimer
        case onBreak
        case timeLeft
        case title
        case userIDs
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.workTimer = try container.decode(Float.self, forKey: .workTimer)
        self.breakTimer = try container.decode(Float.self, forKey: .breakTimer)
        self.onBreak = try container.decode(Bool.self, forKey: .onBreak)
        self.timeLeft = try container.decode(Float.self, forKey: .timeLeft)
        self.title = try container.decode(String.self, forKey: .title)
        self.userIDs = try container.decode([String].self, forKey: .userIDs)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.workTimer, forKey: .workTimer)
        try container.encode(self.breakTimer, forKey: .breakTimer)
        try container.encode(self.onBreak, forKey: .onBreak)
        try container.encode(self.timeLeft, forKey: .timeLeft)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.userIDs, forKey: .userIDs)
    }
}

// Initializes a Response object from the JSON data at the top.
// let room: Room = try! JSONDecoder().decode(Room.self, from: data)

// Turns your Response object into raw JSON data you can send back!
// let roomInJSON = try! JSONEncoder().encode(room)
