//
//  AddressViewController.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/19/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import UIKit

class AddressViewController: UIViewController {

    let addressInfo = AddressView()
    let saveChangesButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupConstraints()
        self.title = "My Address"
    }
    
    func setupUI() {
        saveChangesButton.setTitle("SAVE CHANGES", for: .normal)
        saveChangesButton.backgroundColor = UIColor(red: 204/255, green: 197/255, blue: 188/255, alpha: 1)
        view.addSubview(addressInfo)
        view.addSubview(saveChangesButton)
    }
    
    func setupConstraints() {
        addressInfo.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(68)
            make.bottom.equalToSuperview().offset(-100)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-20)
        }
        saveChangesButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-100)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(180)
        }
    }

}