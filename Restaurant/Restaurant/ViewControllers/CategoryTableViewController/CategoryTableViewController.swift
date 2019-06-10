//
//  CategoryTableViewController.swift
//  Restaurant
//
//  Created by Yury Popov on 06/06/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    
    var categories = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        MenuController.shared.fetchCategories { categories in
            //проверяем что категории есть
            guard let categories = categories else { return }
            
            self.updateUI(with: categories)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    func updateUI(with categories: [String]) {
        DispatchQueue.main.async {
            self.categories = categories
            self.tableView.reloadData()
        }
        
    }
    
    func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "MenuSegue" else { return }
        
        let controller = segue.destination as! MenuTableViewController
        
        let index = tableView.indexPathForSelectedRow!.row
        
        let category = categories[index]
        
        controller.category = category
    }
    
 
}
