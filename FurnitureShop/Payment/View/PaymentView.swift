//
//  PaymentView.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/19/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class PaymentView: UIView {
    
    let cardLabel = UILabel()
    let cardImage = UIImageView()
    let cardTextField = UITextField()
    let dateLabel = UILabel()
    let datePicker = UIPickerView()
    let cardNameLabel = UILabel()
    let nameTextField = UITextField()
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        cardImage.tintColor = .black
        cardTextField.borderStyle = .roundedRect
        cardTextField.returnKeyType = .done
        cardTextField.keyboardType = .numberPad // add done button
        nameTextField.borderStyle = .roundedRect
        nameTextField.returnKeyType = .done
        
        addSubview(cardLabel)
        addSubview(cardImage)
        addSubview(cardTextField)
        addSubview(dateLabel)
        addSubview(datePicker)
        addSubview(cardNameLabel)
        addSubview(nameTextField)
    }
    
    func setupConstraints() {
        cardLabel.snp.makeConstraints { (make) in
            make.top.leading.width.equalToSuperview()
            make.height.equalTo(Elements.textFieldLabel.size.height)
        }
        cardImage.snp.makeConstraints { (make) in
            make.top.equalTo(cardLabel.snp.bottom).offset(Spaces.tiny.size)
            make.leading.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(40)
        }
        cardTextField.snp.makeConstraints { (make) in
            make.leading.equalTo(cardImage.snp.trailing).offset(Spaces.small.size)
            make.trailing.equalToSuperview()
            make.top.equalTo(cardLabel.snp.bottom).offset(Spaces.tiny.size)
            make.height.equalTo(Elements.textField.size.height)
        }
        dateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(cardTextField.snp.bottom).offset(Spaces.medium.size)
            make.leading.width.equalToSuperview()
            make.height.equalTo(Elements.textFieldLabel.size.height)
        }
        datePicker.snp.makeConstraints { (make) in
            make.top.equalTo(dateLabel.snp.bottom).offset(Spaces.tiny.size)
            make.leading.width.equalToSuperview()
            make.height.equalTo(150)
        }
        cardNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(datePicker.snp.bottom).offset(Spaces.medium.size)
            make.leading.width.equalToSuperview()
            make.height.equalTo(Elements.textFieldLabel.size.height)
        }
        nameTextField.snp.makeConstraints { (make) in
            make.top.equalTo(cardNameLabel.snp.bottom).offset(Spaces.tiny.size)
            make.leading.width.equalToSuperview()
            make.height.equalTo(Elements.textFieldLabel.size.height)
        }
    }
}
