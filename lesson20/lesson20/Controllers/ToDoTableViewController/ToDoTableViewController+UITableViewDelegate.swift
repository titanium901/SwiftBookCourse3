//
//  ToDoTableViewController+UITableViewDelegate.swift
//  lesson20
//
//  Created by Yury Popov on 31/05/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

extension ToDoTableViewController {
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            try! ToDoClass.realm.write {
                ToDoClass.realm.delete(todoClass[indexPath.row])
            }
            todoClass.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        
        
        
        
        
        //For struct
//        switch editingStyle {
//        case .delete:
//            todos.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        case .insert:
//            break
//        case .none:
//            break
//        @unknown default:
//            fatalError()
//        }
    }
}

