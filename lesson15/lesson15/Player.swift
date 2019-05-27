//
//  Player.swift
//  lesson15
//
//  Created by Yury Popov on 22/05/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import Foundation

struct Player {
    var name: String
    var lastName: String
    var team: String
    var image: String
    var info: String
    var fullName: String {
        return "\(name) \(lastName)"
    }
}


