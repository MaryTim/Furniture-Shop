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
            make.top.equalTo(acceptLabel.snp.bottom).offset(Spaces.tiny.size)
            make.leading.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(35)
        }
        mastercard.snp.makeConstraints { (make) in
            make.top.equalTo(acceptLabel.snp.bottom).offset(Spaces.tiny.size)
            make.leading.equalTo(visa.snp.trailing).offset(Spaces.tiny.size)
            make.height.equalTo(20)
            make.width.equalTo(30)
        }
        paypal.snp.makeConstraints { (make) in
            make.top.equalTo(acceptLabel.snp.bottom).offset(Spaces.tiny.size)
            make.leading.equalTo(mastercard.snp.trailing).offset(Spaces.tiny.size)
            make.height.equalTo(20)
            make.width.equalTo(30)
        }
    }
}
