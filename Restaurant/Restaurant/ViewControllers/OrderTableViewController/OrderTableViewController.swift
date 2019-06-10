//
//  OrderTableViewController.swift
//  Restaurant
//
//  Created by Yury Popov on 07/06/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class OrderTableViewController: UITableViewController {
    
    var orderMinutes = 0
    
    
    
    @IBOutlet weak var submitButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        checkSubmitButton()
    }
    
    func setupUI() {
        
        navigationItem.leftBarButtonItem = self.editButtonItem
        NotificationCenter.default.addObserver(
            tableView!,
            selector: #selector(UITableView.reloadData),
            name: MenuController.orderUpdateNotification,
            object: nil
        )
    }
    
    func uploadOrder() {
  
        let menuIds = MenuController.shared.order.menuItems.map { $0.id }
        
        MenuController.shared.submitOrder(forMenuIDs: menuIds) { minutes in
            guard let minutes = minutes else { return }
            
            self.orderMinutes = minutes
            
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "ConfirmationSegue", sender: nil)
            
            }
        }
            }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ConfirmationSegue" else { return }
        
        let controller = segue.destination as! OrderConfirmationViewController
        controller.minutes = orderMinutes
    }
    
    func checkSubmitButton() {
        if !tableView.visibleCells.isEmpty {
            submitButton.isEnabled = true
            navigationItem.leftBarButtonItem?.isEnabled = true
            navigationItem.leftBarButtonItem?.isEnabled = true
        } else {
            submitButton.isEnabled = false
            navigationItem.leftBarButtonItem?.isEnabled = false
            navigationItem.leftBarButtonItem?.isEnabled = false
            
        }
    }

    
    @IBAction func submitTapped() {
        
        let menuItems = MenuController.shared.order.menuItems
        let orderCount = menuItems.count
        let orderTotal = menuItems.reduce(0) { $0 + $1.price }
        let formattedOrder = String(format: "$%.2f", orderTotal)
        
        let alert = UIAlertController(
            title: "Confirm Order",
            message: "Your total is \(orderCount) item(s) for \(formattedOrder)",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(
            title: "Submit",
            style: .default,
            handler: { _ in
                self.uploadOrder()
        }
        ))
        
        alert.addAction(UIAlertAction(
            title: "Cancel",
            style: .cancel,
            handler: nil
        ))
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        print(#function)
        guard segue.identifier == "DismissConfirmation" else { return }
        
        MenuController.shared.order.menuItems.removeAll()
        print(MenuController.shared.order.menuItems)
    }
}
