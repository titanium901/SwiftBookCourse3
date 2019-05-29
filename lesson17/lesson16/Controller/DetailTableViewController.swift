//
//  DetailTableViewController.swift
//  lesson16
//
//  Created by Yury Popov on 24/05/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    
    
    @IBOutlet weak var button: UIBarButtonItem!
    @IBOutlet weak var emojiTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var descTextField: UITextField!
    
    var emoji = Emoji()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emojiTextField.delegate = self
        emojiTextField.text = emoji.emoji
        nameTextField.text = emoji.name
        phoneNumberTextField.text = emoji.phoneNumber
        descTextField.text = emoji.desc
        textFieldChanged()
        print(emoji)
    }

    // MARK: - Table view data source



    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "saveSegue" else { return }
        emoji.emoji = emojiTextField.text ?? ""
        emoji.name = nameTextField.text ?? ""
        emoji.phoneNumber = phoneNumberTextField.text ?? ""
        emoji.desc = descTextField.text ?? ""
        print(#function, emoji)
        
        
    }
 
    
    @IBAction func textFieldChanged() {
        
        
        if ((emojiTextField.text ?? "").isEmpty) || ((nameTextField.text ?? "").isEmpty) || ((phoneNumberTextField.text ?? "").isEmpty) || !(emojiTextField.text?.isContainEmoji())! {
          
            button.isEnabled = false
            
        } else {
            button.isEnabled = true
        }
        
        
    }

}

extension DetailTableViewController: UITextFieldDelegate {
    
}

extension String {
    func isContainEmoji() -> Bool {
        let isContain = unicodeScalars.first(where: { $0.isEmoji }) != nil
        return isContain
    }
}


extension UnicodeScalar {
    
    var isEmoji: Bool {
        switch value {
        case 0x1F600...0x1F64F,
             0x1F300...0x1F5FF,
             0x1F680...0x1F6FF,
             0x1F1E6...0x1F1FF,
             0x2600...0x26FF,
             0x2700...0x27BF,
             0xFE00...0xFE0F,
             0x1F900...0x1F9FF,
             65024...65039,
             8400...8447,
             9100...9300,
             127000...127600:
            return true
        default:
            return false
        }
    }
    
}
