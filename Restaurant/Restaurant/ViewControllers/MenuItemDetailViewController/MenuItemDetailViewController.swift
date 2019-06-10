//
//  MenuItemDetailViewController.swift
//  Restaurant
//
//  Created by Yury Popov on 06/06/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class MenuItemDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var detailTextLabel: UILabel!
    @IBOutlet weak var addToOrderButton: UIButton!
    
    var menuItem: MenuItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        updateUI()
    }
    
    func setupUI() {
        addToOrderButton.layer.cornerRadius = 5
    }
    
    func updateUI() {
        let newUrlString = menuItem.imageURL.absoluteString.replacingOccurrences(of: "http://localhost:8090", with: "http://server.getoutfit.ru:8090")
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: newUrlString) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: imageData)
            }

        }
        titleLabel.text = menuItem.name
        priceLabel.text = String(format: "$%.2f", menuItem.price)
        detailTextLabel.text = menuItem.detailText
    }
    
    @IBAction func orderButtonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 3, y: 3)
            self.addToOrderButton.transform = CGAffineTransform.identity
        }
        MenuController.shared.order.menuItems.append(menuItem)
    }
}
