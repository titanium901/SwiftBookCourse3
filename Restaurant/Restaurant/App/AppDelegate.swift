//
//  AppDelegate.swift
//  Restaurant
//
//  Created by Yury Popov on 06/06/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var orderTabBarItem: UITabBarItem!
    
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let temporaryDirectory = NSTemporaryDirectory()
        let urlCache = URLCache(
            memoryCapacity: 25_000_000,
            diskCapacity: 50_000_000,
            diskPath: temporaryDirectory
        )
        URLCache.shared = urlCache
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateOrderBadge),
            name: MenuController.orderUpdateNotification,
            object: nil
        )
        
        orderTabBarItem = (window!.rootViewController! as! UITabBarController).viewControllers![1].tabBarItem
        
        return true
    }
    
    @objc func updateOrderBadge() {
        let meals = MenuController.shared.order.menuItems.count
        
        orderTabBarItem.badgeValue = meals == 0 ? nil : "\(meals)"
    }
}

