//
//  SecondViewController.swift
//  lesson3.1
//
//  Created by Yury Popov on 30/04/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var loginText = ""
    var passwordText = ""
    var welcomeText = ""
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        if loginText != "" && passwordText != "" {
            infoLabel.text = "Login: \(loginText) \n Password: \(passwordText)"
        } else if welcomeText == "Forgot User Name" || welcomeText == "Forgot Password" {
            infoLabel.isHidden = true
            welcomeLabel.text = welcomeText
        } else {
            infoLabel.text = "Please enter correct \n Login and Password"
        }
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
