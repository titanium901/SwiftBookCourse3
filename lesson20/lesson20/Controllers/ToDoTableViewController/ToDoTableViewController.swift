//
//  ToDoTableViewController.swift
//  lesson20
//
//  Created by Yury Popov on 31/05/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit
import RealmSwift

class ToDoTableViewController: UITableViewController {
    
    // MARK: - Stored Properties
//    var todos = [ToDo]()
 
    var todoClass = [ToDoClass]() {
        didSet {
            // Persist the data
            try! ToDoClass.realm.write {
                ToDoClass.realm.add(todoClass)
            }
        }
    }
    
    // MARK: - UITableViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        //realm
        if let savedToDos = ToDoClass.loadToDos() {
            todoClass = savedToDos
        } else {
            todoClass = ToDoClass.loadSampleToDos()
        }
        print(Realm.Configuration.defaultConfiguration.fileURL)
        //struct
//        todos = ToDo.loadToDos()
        setupNavBar()
        print(todoClass)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToDoDetailSegue" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let detailVC = segue.destination as! ToDoViewController
                detailVC.todo = todoClass[indexPath.row]
                detailVC.title = "Edit To Do"
                detailVC.navigationController?.navigationItem.rightBarButtonItem?.title = "Update"
               
            } else {
                print(#function, segue.identifier ?? "")
            }
        }
        
    }
    @IBAction func unwind(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveSegue" else { return }
        guard let detailVC = segue.source as? ToDoViewController else { return }
//        print(#function, detailVC.todo ?? "nil")
        guard let todo = detailVC.todo else { return }
        
        if let path = tableView.indexPathForSelectedRow {
            todoClass[path.row] = todo
            print(path)


        } else {
            todoClass.append(todo)


        }

        tableView.reloadData()
        print(#function)
    }
    
    
    
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.blackTranslucent
       
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 0.5, height: 0.5))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "todo2")
        imageView.image = image
        navigationItem.titleView = imageView
       
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
}



