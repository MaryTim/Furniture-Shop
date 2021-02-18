//
//  CartViewController.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/16/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    
    let cartLabel = UILabel()
    let tableV = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableV.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.cellID)
        tableV.dataSource = self
        tableV.delegate = self
        setupUI()
        setupConstraints()
    }
    
    func setupUI() {
        cartLabel.text = "Cart"
        cartLabel.font = UIFont(name: "PlayfairDisplay-Bold", size: 30)
        cartLabel.textAlignment = .center
        view.addSubview(cartLabel)
        view.addSubview(tableV)
    }
    
    func setupConstraints() {
        cartLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(50)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(70)
        }
        
        tableV.snp.makeConstraints { (make) in
            make.top.equalTo(cartLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-30)
        }
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.cellID, for: indexPath)
        
        return cell
    }
    
    
}
