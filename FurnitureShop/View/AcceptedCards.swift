//
//  AcceptedCards.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/19/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import Foundation
import UIKit

class AcceptedCards: UIView {
    
    let acceptLabel = UILabel()
    let visa = UIImageView()
    let mastercard = UIImageView()
    let paypal = UIImageView()
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           setupUI()
           setupConstraints()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    func setupUI() {
        acceptLabel.text = "WE ACCEPT"
        acceptLabel.font = acceptLabel.font.withSize(13)
        visa.image = UIImage(named: "visa")
        mastercard.image = UIImage(named: "mastercard")
        paypal.image = UIImage(named: "paypal")
        addSubview(acceptLabel)
        addSubview(visa)
        addSubview(mastercard)
        addSubview(paypal)
    }
    
    func setupConstraints() {
        acceptLabel.snp.makeConstraints { (make) in
            make.top.leading.width.equalToSuperview()
            make.height.equalTo(15)
        }
        visa.snp.makeConstraints { (make) in
            make.top.equalTo(acceptLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(40)
        }
        mastercard.snp.makeConstraints { (make) in
            make.top.equalTo(acceptLabel.snp.bottom).offset(10)
            make.leading.equalTo(visa.snp.trailing).offset(10)
            make.height.equalTo(20)
            make.width.equalTo(40)
        }
        paypal.snp.makeConstraints { (make) in
            make.top.equalTo(acceptLabel.snp.bottom).offset(10)
            make.leading.equalTo(mastercard.snp.trailing).offset(10)
            make.height.equalTo(20)
            make.width.equalTo(40)
        }
    }
}
