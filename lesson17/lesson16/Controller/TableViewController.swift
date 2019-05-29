//
//  TableViewController.swift
//  lesson16
//
//  Created by Yury Popov on 24/05/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit
import RealmSwift

class TableViewController: UITableViewController {

  
    var realm: Realm!
    
    var emojiArray: Results<Emoji>!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        realm = try! Realm()
     
        print(Realm.Configuration.defaultConfiguration.fileURL)

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
        emojiArray =  realm.objects(Emoji.self)
    }
 
    
    // MARK: - Table view data source

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       
        if emojiArray != nil {
            
            return emojiArray.count
            
        }
        print(#function)
        return 0
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! TableViewCell
        
        let emoji = emojiArray[indexPath.row]
        cell.emojiLabel.text = emoji.emoji
        cell.nameLabel.text = emoji.name
        cell.phoneNumberLabel.text = emoji.phoneNumber
        cell.descLabel.text = emoji.desc
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Удаление элементов
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
           let emoji = emojiArray[indexPath.row]
            try! self.realm.write {
                self.realm.delete(emoji)
            }
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
   

    // In a storyboard-based application, you will often want to do a little preparation before navigation
 
 
    @IBAction func unwind(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveSegue" else { return }
        guard let detailVC = segue.source as? DetailTableViewController else { return }
        var emoji = detailVC.emoji


        emoji.emoji = checkEmogiCount(detailVC.emojiTextField)
        print(#function)

            try! realm.write {
                realm.add(emoji)
            }

        tableView.reloadData()
    }
    
 

    
    func checkEmogiCount(_ viewEmogi: UITextField) -> String {
        var arrayText = Array(viewEmogi.text ?? "")
        print(arrayText)
        viewEmogi.text = String(arrayText[0])
        
        return viewEmogi.text ?? ""
    }
    
    
    func setup() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.backBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 21/255,
                                                                   green: 101/255,
                                                                   blue: 192/255,
                                                                   alpha: 1)
        tableView.allowsSelection = false
    }

}
