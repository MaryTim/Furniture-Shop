//
//  GreetingLabel.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/15/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class GreetingUserView: UIView {
    
    let greetingLabel = UILabel()
    let mainLabel = UILabel()
    var userName = "Masha"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
        setUPConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpUI() {
        greetingLabel.text = "Hi, \(userName)"
        greetingLabel.adjustsFontSizeToFitWidth = true
        greetingLabel.textColor = MyColor.fedora08.value
        addSubview(greetingLabel)
        
        mainLabel.text = "For your house"
        mainLabel.textColor = .black
        mainLabel.font = UIFont(name: "PlayfairDisplay-Bold", size: 35)
        mainLabel.adjustsFontSizeToFitWidth = true
        addSubview(mainLabel)
    }
    
    func setUPConstraints() {
        greetingLabel.snp.makeConstraints { (make) in
            make.top.leading.width.equalToSuperview()
            make.height.equalTo(15)
        }
        mainLabel.snp.makeConstraints { (make) in
            make.top.equalTo(greetingLabel.snp.bottom).offset(Spaces.tiny.size)
            make.leading.width.equalToSuperview()
            make.height.equalTo(45)
        }
    }
}
