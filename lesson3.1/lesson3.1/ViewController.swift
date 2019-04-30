//
//  ViewController.swift
//  lesson3.1
//
//  Created by Yury Popov on 30/04/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        loginText.text = ""
        passwordText.text = ""
        loginButton.isEnabled = false
    }
    
    @IBAction func logInButton(_ sender: UIButton) {
        
    }
    
    @IBAction func loginInput(_ sender: Any) {
        loginButton.isEnabled = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier
        let secondVC = segue.destination as! SecondViewController
        
        switch identifier {
        case "loginVC":
            guard let loginT = loginText.text else { return }
            guard let passT = passwordText.text else { return }
            secondVC.loginText = loginT
            secondVC.passwordText = passT
        case "forgotName":
            secondVC.welcomeText = "Forgot User Name"
        case "forgotPassword":
            secondVC.welcomeText = "Forgot Password"
        default:
            print("nil")
        }
        
    }
}

