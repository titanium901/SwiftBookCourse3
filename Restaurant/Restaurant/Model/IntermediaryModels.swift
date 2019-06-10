//
//  IntermediaryModels.swift
//  Restaurant
//
//  Created by Yury Popov on 06/06/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

struct Categories: Codable {
    let categories: [String]
}

struct PreparationTime: Codable {
    let prepTime: Int
    
    enum CodingKeys:String, CodingKey {
        case prepTime = "preparation_time"
    }
}
