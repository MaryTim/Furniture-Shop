//
//  CustomTabBarController.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/16/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let item1 = HomeViewController()
        let houseIcon = UITabBarItem(title: "Tab 1", image: UIImage(named: "house"), selectedImage: UIImage(named: "house"))
        item1.tabBarItem = houseIcon
        
        let item2 = SearchViewController()
        let magnifierIcon = UITabBarItem(title: "Tab 2", image: UIImage(named: "magnifyingglass"), selectedImage: UIImage(named: "magnifyingglass"))
        item2.tabBarItem = magnifierIcon
       
        self.viewControllers =  [item1, item2]  //array of the root view controllers displayed by the tab bar interface
    }

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Selected viewController: \(viewController.title ?? "") ?")
        return true;
    }
}
