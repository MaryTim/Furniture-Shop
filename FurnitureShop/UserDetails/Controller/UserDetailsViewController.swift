//
//  UserDetailsViewController.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/19/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import UIKit
import SnapKit

class UserDetailsViewController: UIViewController {
    
    let userDetails = UserDetailView()
    let saveChangesButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    @objc func savePressed(sender: UIButton!) {
        print("User's info is saved")
    }
    
    func setupUI() {
        view.backgroundColor = .white
        self.title = "My Details"
        saveChangesButton.setTitle("SAVE CHANGES", for: .normal)
        saveChangesButton.backgroundColor = MyColor.silverRust1.value
        saveChangesButton.addTarget(self, action: #selector(savePressed), for: .touchUpInside)
        saveChangesButton.setBackgroundColor(color: MyColor.fedora1.value, forState: .highlighted)
        view.addSubview(userDetails)
        view.addSubview(saveChangesButton)
    }
    
    func setupConstraints() {
        userDetails.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(68)
            make.bottom.equalToSuperview().offset(-100)
            make.leading.equalToSuperview().offset(Spaces.tiny.size)
            make.trailing.equalToSuperview().offset(-20)
        }
        saveChangesButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-100)
            make.height.equalTo(Elements.saveButton.size.height)
            make.centerX.equalToSuperview()
            make.width.equalTo(Elements.saveButton.size.width)
        }
    }
}
