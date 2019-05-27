//
//  TableViewController.swift
//  lesson16
//
//  Created by Yury Popov on 24/05/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var emojis = [Emoji]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.backBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 21/255,
                                                                   green: 101/255,
                                                                   blue: 192/255,
                                                                   alpha: 1)
        
        //check userDef
        if (defaults.object(forKey: "savedEmojis") != nil) {
            emojis = loadData()
        } else {
            emojis = Emoji.load()
        }

        
    }
    
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return emojis.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! TableViewCell
        let row = indexPath.row
        let emoji = emojis[row]

        cell.emojiLabel.text = emoji.emoji
        cell.nameLabel.text = emoji.name
        cell.phoneNumberLabel.text = "Tel: " + emoji.phoneNumber
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
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "EmojiDetailSegue" else { return }
        
        guard let detailVC = segue.destination as? DetailTableViewController else { return }
        
        guard let path = tableView.indexPathForSelectedRow else { return }
        
//        tableView.deselectRow(at: path, animated: false)
        
        let row = path.row
        let emoji = emojis[row]
        
        detailVC.navigationItem.title = "Edit"
        detailVC.emoji = emoji
    }
 
    @IBAction func unwind(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveSegue" else { return }
        guard let detailVC = segue.source as? DetailTableViewController else { return }
        var emoji = detailVC.emoji
        emoji.emoji = checkEmogiCount(detailVC.emojiTextField)
    
        
        if let path = tableView.indexPathForSelectedRow {
            emojis[path.row] = emoji
//           saveEmojis(emojis)
            tableView.deselectRow(at: path, animated: false)
            
        } else {
            emojis.append(emoji)
            
        }

        saveEmojis(emojis)
        tableView.reloadData()
    }
    
    //save in usedDef
    func saveEmojis(_ emojis: [Emoji]) {
        let data = emojis.map { try? JSONEncoder().encode($0)}
        defaults.set(data, forKey: "savedEmojis")

    }
    //load from userDef
    func loadData() -> [Emoji] {
        guard let encodedData = defaults.array(forKey: "savedEmojis") as? [Data] else {
            return []
        }
        
        return encodedData.map { try! JSONDecoder().decode(Emoji.self, from: $0) }
    }
    
    func checkEmogiCount(_ viewEmogi: UITextField) -> String {
        var arrayText = Array(viewEmogi.text ?? "")
        print(arrayText)
        viewEmogi.text = String(arrayText[0])
        
        return viewEmogi.text ?? ""
    }

}
