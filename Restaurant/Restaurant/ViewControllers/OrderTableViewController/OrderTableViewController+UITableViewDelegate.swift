//
//  ToDoTableViewController+UITableViewDelegate.swift
//  Restaurant
//
//  Created by Yury Popov on 10/06/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

extension OrderTableViewController {
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            MenuController.shared.order.menuItems.remove(at: indexPath.row)
            checkSubmitButton()
        }
    }
}
