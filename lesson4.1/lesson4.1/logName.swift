//
//  logName.swift
//  lesson4.1
//
//  Created by Yury Popov on 06/05/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import Foundation
import UIKit


var nameOfLog = ""

func updateUI(nameOfView: String, label: UILabel, nameVC: String) {
    nameOfLog += " \n" + nameOfView + " \(nameVC)"
    label.text = nameOfLog
    
}
