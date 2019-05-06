//
//  BlueViewController.swift
//  lesson4.1
//
//  Created by Yury Popov on 06/05/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {

    let blueViewControllerName = #function
    
    
    @IBOutlet weak var logLabel: UILabel!
    @IBOutlet weak var viewLabelName: UILabel!
    @IBOutlet weak var blueScrolView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blueScrolView.backgroundColor = .white
        viewLabelName.text = blueViewControllerName
        print("---------")
        print(blueViewControllerName)
        print(#function, blueViewControllerName)
        updateUI(nameOfView: "viewDidLoad()", label: logLabel, nameVC: "BlueViewController")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function, blueViewControllerName)
        updateUI(nameOfView: "viewWillAppear(_:)", label: logLabel, nameVC: "BlueViewController")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function, blueViewControllerName)
        updateUI(nameOfView: "viewDidAppear(_:)", label: logLabel, nameVC: "BlueViewController")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function, blueViewControllerName)
        updateUI(nameOfView: "viewWillDisappear(_:)", label: logLabel, nameVC: "BlueViewController")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function, blueViewControllerName)
        updateUI(nameOfView: "viewDidDisappear(_:)", label: logLabel, nameVC: "BlueViewController")
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
