//
//  CategoryTableViewController+UITableViewDataSource.swift
//  Restaurant
//
//  Created by Yury Popov on 06/06/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//
import UIKit

extension CategoryTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell")!
        configure(cell, forItemAt: indexPath)
        return cell
    }
    
    func configure(_ cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let category = categories[indexPath.row]
        cell.textLabel?.text = category.capitalized
        if cell.textLabel?.text == "Appetizers" {
            cell.imageView?.image = UIImage(named: "appet")
        } else {
            cell.imageView?.image = UIImage(named: "ent")
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
