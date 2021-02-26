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
    let checkoutButton = UIButton()
    let totalLabel = UILabel()
    
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
        tableV.separatorStyle = .none
        tableV.allowsSelection = false
        checkoutButton.tag = 0
        checkoutButton.setTitle("CHECKOUT", for: .normal)
        checkoutButton.setTitleColor(.black, for: .normal)
        checkoutButton.backgroundColor = UIColor(red: 204/255, green: 197/255, blue: 188/255, alpha: 0.9)
        checkoutButton.layer.cornerRadius = 4.0
        checkoutButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        totalLabel.text = "Total: $5347" //change this later (calculate sum of all items)
        totalLabel.backgroundColor = .clear
        totalLabel.textColor = UIColor(red: 111/255, green: 108/255, blue: 110/255, alpha: 1)
        view.addSubview(cartLabel)
        view.addSubview(tableV)
        view.addSubview(checkoutButton)
        view.addSubview(totalLabel)
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
            make.bottom.equalToSuperview().offset(-140)
        }
        totalLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(80)
            make.top.equalTo(tableV.snp.bottom).offset(15)
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
        checkoutButton.snp.makeConstraints { (make) in
            make.leading.equalTo(totalLabel.snp.trailing).offset(40)
            make.bottom.equalToSuperview().offset(-93)
            make.width.equalTo(120)
            make.height.equalTo(40)
        }
        
    }
    
//MARK: - buttom action
// Add actions to =/- buttons (update quantityLabel)
    
    @objc func buttonAction(sender: UIButton!) {
        print("Button \(sender.titleLabel?.text ?? "unknown") tapped")
    }
}

//MARK: - delegate, data source methods

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.cellID, for: indexPath) as! CustomTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}