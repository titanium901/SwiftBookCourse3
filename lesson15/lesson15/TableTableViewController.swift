//
//  TableTableViewController.swift
//  lesson15
//
//  Created by Yury Popov on 22/05/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class TableTableViewController: UITableViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(arrayPlayers)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayPlayers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = arrayPlayers[indexPath.row].name + " " + arrayPlayers[indexPath.row].lastName
                cell.imageView?.image = UIImage(named: arrayPlayers[indexPath.row].image)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailVC" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let detailVC = segue.destination as! DetailViewController
                detailVC.player = arrayPlayers[indexPath.row]
            }
        } else {
            print(#function, segue.identifier ?? "nil")
        }
    }
    
    //unwind
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveSegue" else { return }
        guard let detailVC = segue.source as? DetailViewController else { return }
        
        let player = detailVC.player
        
        if let path = tableView.indexPathForSelectedRow {
            arrayPlayers[path.row] = player
            tableView.deselectRow(at: path, animated: false)
            arrayPlayers.append(player)
        } else {
            print(#function)
        }
        tableView.reloadData()
        
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
