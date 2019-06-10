//
//  OrderConfirmationViewController.swift
//  Restaurant
//
//  Created by Yury Popov on 07/06/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class OrderConfirmationViewController: UIViewController {

    @IBOutlet weak var timeRemainingLabel: UILabel!
    
    var minutes: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        
        timeRemainingLabel.text = "Thank you for your order!  Your wait time is \(minutes!) minutes."
    }
  

}
