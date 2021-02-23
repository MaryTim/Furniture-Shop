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
        greetingLabel.textColor = UIColor(red: 111/255, green: 108/255, blue: 110/255, alpha: 0.8)
        addSubview(greetingLabel)
        
        mainLabel.text = "For your house"
        mainLabel.textColor = .black
        mainLabel.font = UIFont(name: "PlayfairDisplay-Bold", size: 35)
        mainLabel.adjustsFontSizeToFitWidth = true
        addSubview(mainLabel)
    }
    
    func setUPConstraints() {
        greetingLabel.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(20)
        }
        mainLabel.snp.makeConstraints { (make) in
            make.top.equalTo(greetingLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
    }
}
