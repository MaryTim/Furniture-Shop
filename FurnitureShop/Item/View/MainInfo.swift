//
//  MainInfo.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/23/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import UIKit

class MainInfo: UIView {
    
    var itemName = UILabel()
    var itemPrice = UILabel()
    var itemDescription = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        itemName.font = UIFont(name: "PlayfairDisplay-Bold", size: 20)
        itemName.adjustsFontSizeToFitWidth = true
        itemName.numberOfLines = 0
        itemPrice.font = UIFont(name: "Al Nile", size: 28)
        itemPrice.textColor = MyColor.priceItemVC.value
        itemDescription.textColor = MyColor.description.value
        itemDescription.textAlignment = .justified
        itemDescription.adjustsFontSizeToFitWidth = true
        itemDescription.numberOfLines = 0
        addSubview(itemName)
        addSubview(itemPrice)
        addSubview(itemDescription)
    }
    
    func setupConstraints() {
        itemName.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(30)
        }
        itemPrice.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(itemName.snp.bottom).offset(Spaces.small.size)
            make.bottom.equalTo(itemDescription.snp.top).offset(-3)
        }
        itemDescription.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(itemPrice.snp.bottom).offset(3)
        }
    }
}
