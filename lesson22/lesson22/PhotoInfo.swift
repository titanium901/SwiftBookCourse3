//
//  PhotoInfo.swift
//  lesson22
//
//  Created by Yury Popov on 05/06/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import Foundation

struct PhotoInfo: Codable {
    var title: String
    var description: String
    var url: URL
    var copyright: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case description = "explanation"
        case url
        case copyright
    }
}
