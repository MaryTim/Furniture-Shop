//
//  ItemViewController.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/23/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {
    
    let itemPic = UIImageView()
    let info = MainInfo()
    let cartButton = UIButton()
    let colors = ColorButtons()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupUI() {
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Back", style: .plain, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem?.tintColor = .black
        itemPic.image = UIImage(named: "accountPic1")
        cartButton.setImage(UIImage(systemName: "cart"), for: .normal)
        cartButton.tintColor = .black
        cartButton.layer.cornerRadius = 4.0
        cartButton.layer.borderWidth = 1
        cartButton.layer.borderColor = UIColor.black.cgColor
        cartButton.addTarget(self, action: #selector(goToCart), for: .touchUpInside)
        view.addSubview(itemPic)
        view.addSubview(info)
        view.addSubview(cartButton)
        view.addSubview(colors)
    }
    
    @objc func goToCart(sender: UIButton!) {
        // ????
        cartButton.backgroundColor = .darkGray
        print("Add the item to a cart")
    }
    
    func setupConstraints() {
        itemPic.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(400)
        }
        info.snp.makeConstraints { (make) in
            make.top.equalTo(itemPic.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(300)
        }
        colors.snp.makeConstraints { (make) in
            make.top.equalTo(info.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
        cartButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-50)
            make.height.equalTo(40)
            make.width.equalTo(50)
            make.centerX.equalToSuperview()
        }
    }
}
