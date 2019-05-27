//
//  Emojis.swift
//  lesson16
//
//  Created by Yury Popov on 24/05/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

struct Emoji: Codable {
    var emoji: String
    let name: String
    let phoneNumber: String
    let desc: String
    
    static func load() -> [Emoji] {
        let emojis = [
            Emoji(emoji: "😎", name: "Tarasov", phoneNumber: "+79057777771", desc: "Боец"),
            Emoji(emoji: "😊", name: "School Boy", phoneNumber: "+79011011122", desc: "Школьник"),
            Emoji(emoji: "😤", name: "Amiran", phoneNumber: "+7000101010", desc: "Хач"),
            Emoji(emoji: "😴", name: "Ed", phoneNumber: "+7111223344", desc: "Билл"),
            Emoji(emoji: "🤢", name: "Sobolev", phoneNumber: "$$$", desc: "Хайпожер")
        ]
        
        return emojis
    }
}
