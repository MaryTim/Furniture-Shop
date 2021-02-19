//
//  UserViewController.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/16/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import UIKit
import SnapKit

class UserViewController: UIViewController {
    
    let accountView = AccountTopView()
    let tableView = UITableView()
    let categoriesArray = [
        UserInfoCategory(name: "My details", categoryIcon: UIImage(systemName: "person.crop.rectangle")!),
           UserInfoCategory(name: "Address", categoryIcon: UIImage(systemName: "house")!),
           UserInfoCategory(name: "Payment", categoryIcon: UIImage(systemName: "creditcard")!),
           UserInfoCategory(name: "Sign out", categoryIcon: UIImage(systemName: "arrow.down.to.line.alt")!),
       ]
    let vcArray = [UserDetailsViewController(), AddressViewController(), PaymentViewController(), SignOutViewController()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isScrollEnabled = false
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: UserTableViewCell.cellID)
        tableView.delegate = self
        tableView.dataSource = self
        setupUI()
        setupConstraints()
    }
    
    func setupUI() {
        view.addSubview(accountView)
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        accountView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(280)
        }
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(accountView.snp.bottom).offset(130)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-100)
        }
    }
}

extension UserViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.cellID, for: indexPath) as! UserTableViewCell
        
        cell.icon.image = categoriesArray[indexPath.row].categoryIcon
        cell.section.text = categoriesArray[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rootVC = vcArray[indexPath.row]
        let navVC = UINavigationController(rootViewController: rootVC)
        present(navVC, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
