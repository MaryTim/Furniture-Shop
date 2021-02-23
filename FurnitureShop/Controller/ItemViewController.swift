//
//  ItemViewController.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/23/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Back", style: .plain, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
}
