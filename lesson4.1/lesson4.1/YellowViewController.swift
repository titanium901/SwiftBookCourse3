//
//  YellowViewController.swift
//  lesson4.1
//
//  Created by Yury Popov on 06/05/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class YellowViewController: UIViewController {

    let yellowViewControllerName = #function
    var nameOf = ""
    
    @IBOutlet weak var yellowLabel: UILabel!
    @IBOutlet weak var logLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        scrollView.backgroundColor = UIColor.white
        print("---------")
        print(yellowViewControllerName)
        print(#function, yellowViewControllerName)
        let didLoad = #function
        yellowLabel.text = yellowViewControllerName
        updateUI(nameOfView: didLoad, label: logLabel, nameVC: yellowViewControllerName)

        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function, yellowViewControllerName)
        let willAppear = #function
        updateUI(nameOfView: willAppear, label: logLabel, nameVC: yellowViewControllerName)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function, yellowViewControllerName)
        let didAppear = #function
        updateUI(nameOfView: didAppear, label: logLabel, nameVC: yellowViewControllerName)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function, yellowViewControllerName)
        let willDisappear = #function
        updateUI(nameOfView: willDisappear, label: logLabel, nameVC: yellowViewControllerName)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function, yellowViewControllerName)
        let didDisappeare = #function
        updateUI(nameOfView: didDisappeare, label: logLabel, nameVC: yellowViewControllerName)
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
