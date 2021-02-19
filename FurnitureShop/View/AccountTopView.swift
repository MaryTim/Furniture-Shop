//
//  AccountTopView.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/18/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class AccountTopView: UIView {
    
    let furnitureImage = UIImageView()
    let userImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        furnitureImage.image = UIImage(named: "accountPic2")
        userImage.layer.cornerRadius = 80
        userImage.clipsToBounds = true
        userImage.image = UIImage(named: "icon")
        
        addSubview(furnitureImage)
        addSubview(userImage)
    }
    
    func setupConstraints() {
        furnitureImage.snp.makeConstraints { (make) in
            make.top.leading.bottom.equalToSuperview()
            make.height.equalTo(200)
        }
        userImage.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(200)
            make.height.width.equalTo(160)
            make.centerX.equalToSuperview()
           
        }
    }
}
