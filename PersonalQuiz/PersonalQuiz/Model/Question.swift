//
//  Questions.swift
//  PersonalQuiz
//
//  Created by Yury Popov on 08/05/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answer: [Answer]
}

enum ResponseType {
    case single, multiple, range
}

struct Answer {
    var text: String
    var type: PlayerType
}

enum PlayerType {
    case messi, ronaldo, vidal, buffon
    
    var definition: String {
        switch self {
        case .messi:
            return "Вы любите бывать в компании. Вы всегда окружены друзьями. Вам нравится играть играть и быть лучшим другом для всех."
        case .ronaldo:
            return "Вы гуляете сами по себе. Вам нравится свобода и самостоятельность"
        case .vidal:
            return "Вам нравится все мягкое. Вы здоровы и полны энергии."
        case .buffon:
            return "Вы мудры не по годам. Медленный и вдумчивй выигрывает гонку."
            
        }
    }
}
