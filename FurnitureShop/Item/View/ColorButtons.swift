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
    var colorsArray =  [
        Color(name: UIColor.black),
        Color(name: UIColor.white),
        Color(name: UIColor.blue),
        Color(name: UIColor.gray),
        Color(name: UIColor.yellow),
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(colorLabel)
    }
    
    func setupConstraints() {
        
    }
}
