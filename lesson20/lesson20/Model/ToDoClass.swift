//
//  ToDo.swift
//  lesson20
//
//  Created by Yury Popov on 31/05/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

//struct ToDo {
//    var title: String
//    var isComplete: Bool
//    var dueDate: Date
//    var note:String?
//
//    static let dueDateFormatter: DateFormatter = {
//        let formatter = DateFormatter()
//
//        formatter.dateStyle = .short
//        formatter.timeStyle = .short
//        return formatter
//    }()
//
//    static func loadToDos() -> [ToDoClass] {
//        return defaultToDos()
//    }
//
//    static func defaultToDos() -> [ToDoClass] {
//        return [
//            ToDoClass(title: "ToDo 1 ", isComplete: false, dueDate: Date(), note: "Note 1"),
//            ToDoClass(title: "ToDo 2 ", isComplete: false, dueDate: Date(), note: "Note 2"),
//            ToDoClass(title: "ToDo 3 ", isComplete: false, dueDate: Date(), note: "Note 3"),
//            ToDoClass(title: "ToDo 4 ", isComplete: false, dueDate: Date(), note: "Note 4")
//        ]
//    }
//}

class ToDoClass: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var isComplete: Bool = false
    @objc dynamic var dueDate: Date = Date()
    @objc dynamic var notes: String? = nil
    
    // Get the default Realm
    static let realm = try! Realm()
    
    init(title: String, isComplete: Bool, dueDate: Date, notes: String?) {
        self.title = title
        self.isComplete = isComplete
        self.dueDate = dueDate
        self.notes = notes
        super.init()
    }
    
    required init() {
        super.init()
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    static func loadToDos() -> [ToDoClass]? {
        var todos = [ToDoClass]()
        let todoObjects = realm.objects(ToDoClass.self)
        print(#function, todoObjects.count)
        for todo in todoObjects {
            todos.append(todo)
        }
        return todos
    }
    
    static func loadSampleToDos() -> [ToDoClass] {
        return []
    }
    
    static let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
}


