//
//  DetailViewController.swift
//  lesson15
//
//  Created by Yury Popov on 22/05/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var player = Player(name: "", lastName: "", team: "", image: "", info: "")

    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var fullNameTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playerImage.image = UIImage(named: player.image)
        infoLabel.text = player.info
        fullNameTextField.text = player.name + " " + player.lastName
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "saveSegue" else { return }
        
        
        player = Player(name: fullNameTextField.text!, lastName: "", team: player.team, image: player.image, info: player.info)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailViewController: UITextFieldDelegate {
    
}
