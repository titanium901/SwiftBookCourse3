//
//  RedViewController.swift
//  lesson4.1
//
//  Created by Yury Popov on 06/05/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {
    let redViewControllerName = #function
    
    @IBOutlet weak var redLabel: UILabel!
    
    @IBOutlet weak var labelViewName: UILabel!
    
    @IBOutlet weak var redScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redScrollView.backgroundColor = .white
        labelViewName.text = redViewControllerName
        print("---------")
        print(redViewControllerName)
        print(#function, redViewControllerName)
        updateUI(nameOfView: "viewDidLoad()", label: redLabel, nameVC: "RedViewController")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function, redViewControllerName)
        updateUI(nameOfView: "viewWillAppear(_:)", label: redLabel, nameVC: "RedViewController")
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function, redViewControllerName)
        updateUI(nameOfView: "viewDidAppear(_:)", label: redLabel, nameVC: "RedViewController")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function, redViewControllerName)
        updateUI(nameOfView: "viewWillDisappear(_:)", label: redLabel, nameVC: "RedViewController")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function, redViewControllerName)
        updateUI(nameOfView: "viewDidDisappear(_:)", label: redLabel, nameVC: "RedViewController")
    }
    
    
    /*®
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
