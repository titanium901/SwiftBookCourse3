//
//  ToDoTableViewController+UITableViewDataSource.swift
//  lesson20
//
//  Created by Yury Popov on 31/05/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

extension ToDoTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoClass.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoTableViewCell

        let todo = todoClass[indexPath.row]
        cell.todoLabell.text = todo.title
        cell.dateLabel.text = "\(todo.dueDate)"
        
        return cell
    }
}
