//
//  ColorButtons.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/23/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import UIKit

class ColorButtons: UIView {
    
    let colorLabel = UILabel()
    var colorsArray =  [String]()
    var stack = UIStackView()
    var buttonsArray = [UIButton]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
       
    func setupUI() {
        colorLabel.text = "Colors"
        colorLabel.textAlignment = .center
        stack.alignment = .fill
        stack.spacing = 10
        stack.distribution = .fill
        addSubview(stack)
        addSubview(colorLabel)
    }
    
    func setupConstraints() {
        colorLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(50)
        }
        stack.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(colorLabel.snp.trailing).offset(10)
            make.height.equalTo(30)
            make.trailing.lessThanOrEqualToSuperview()
        }
    }
}
