//
//  ItemViewController.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/23/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {

    let manager = FurnitureManager()
    
    var backgroundImage = UIImageView()
    let itemPic = UIImageView()
    let info = MainInfo()
    let cartButton = UIButton()
    let colors = ColorButtons()

    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.performRequest()
        setupUI()
        setupConstraints()
    }
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupUI() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "background"), for: .default)
        backgroundImage.image = UIImage(named: "background")
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Back", style: .plain, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem?.tintColor = .black
        cartButton.setImage(UIImage(systemName: "cart"), for: .normal)
        cartButton.tintColor = .black
        cartButton.layer.cornerRadius = 4.0
        cartButton.layer.borderWidth = 1
        cartButton.layer.borderColor = UIColor.black.cgColor
        cartButton.addTarget(self, action: #selector(addToCart), for: .touchUpInside)
        
        view.addSubview(backgroundImage)
        view.addSubview(itemPic)
        view.addSubview(info)
        view.addSubview(cartButton)
        view.addSubview(colors)
    }
    
    @objc func addToCart(sender: UIButton!) {
        sender.setBackgroundColor(color: .gray, forState: .highlighted)
        print("Add the item to a cart")

    }

    func setupConstraints() {
        backgroundImage.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        itemPic.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(300)
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

extension ItemViewController: ReturnDataDelegate {
    func returnData(data: FurnitureData) {
        let url = URL(string: data.categories[0].colors[0].itemPic)
        let dataM = try? Data(contentsOf: url!)
        DispatchQueue.main.async {
            self.itemPic.image = UIImage(data: dataM!)
            self.info.itemName.text = data.categories[0].name
            self.info.itemPrice.text = "$" + String(data.categories[0].price)
            self.info.itemDescription.text = data.categories[0].description
        }
    }
}
