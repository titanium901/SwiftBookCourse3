//
//  ViewController.swift
//  lesson21
//
//  Created by Yury Popov on 04/06/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewChange: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func circleButton(_ sender: UIButton) {
        circleAnimate()
    }
    
    @IBAction func triangleButton(_ sender: UIButton) {
        squareAnimate()
    }
    @IBAction func rhombusButton(_ sender: UIButton) {
       rhombusAnimate()
    }
    @IBAction func animationKeyButton(_ sender: UIButton) {
        animationKeys()
    }
    
}





