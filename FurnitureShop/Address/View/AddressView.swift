//
//  AddressView.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/19/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class AddressView: UIView {
    
    let countryLabel = UILabel()
    let country = UIPickerView()
    let cityLabel = UILabel()
    let city = UITextField()
    let addressLabel = UILabel()
    let addressTextField = UITextField()
    let postcodeLabel = UILabel()
    let postcodeTextField = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        city.returnKeyType = .done
        addressTextField.returnKeyType = .done
        postcodeTextField.returnKeyType = .done
        city.borderStyle = .roundedRect
        addressTextField.borderStyle = .roundedRect
        postcodeTextField.borderStyle = .roundedRect
        addSubview(countryLabel)
        addSubview(country)
        addSubview(cityLabel)
        addSubview(city)
        addSubview(addressLabel)
        addSubview(addressTextField)
        addSubview(postcodeLabel)
        addSubview(postcodeTextField)
    }
    
    func setupConstraints() {
        countryLabel.snp.makeConstraints { (make) in
            make.top.leading.width.equalToSuperview()
            make.height.equalTo(Elements.textFieldLabel.size.height)
        }
        country.snp.makeConstraints { (make) in
            make.top.equalTo(countryLabel.snp.bottom).offset(Spaces.tiny.size)
            make.leading.width.equalToSuperview()
            make.height.equalTo(150)
        }
        cityLabel.snp.makeConstraints { (make) in
            make.top.equalTo(country.snp.bottom).offset(Spaces.tiny.size)
            make.leading.width.equalToSuperview()
            make.height.equalTo(Elements.textFieldLabel.size.height)
        }
        city.snp.makeConstraints { (make) in
            make.top.equalTo(cityLabel.snp.bottom).offset(Spaces.tiny.size)
            make.leading.width.equalToSuperview()
            make.height.equalTo(Elements.textField.size.height)
        }
        addressLabel.snp.makeConstraints { (make) in
            make.top.equalTo(city.snp.bottom).offset(Spaces.tiny.size)
            make.leading.width.equalToSuperview()
            make.height.equalTo(Elements.textFieldLabel.size.height)
        }
        addressTextField.snp.makeConstraints { (make) in
            make.top.equalTo(addressLabel.snp.bottom).offset(Spaces.tiny.size)
            make.leading.width.equalToSuperview()
            make.height.equalTo(Elements.textField.size.height)
        }
        postcodeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(addressTextField.snp.bottom).offset(Spaces.tiny.size)
            make.leading.width.equalToSuperview()
            make.height.equalTo(Elements.textFieldLabel.size.height)
        }
        postcodeTextField.snp.makeConstraints { (make) in
            make.top.equalTo(postcodeLabel.snp.bottom).offset(Spaces.tiny.size)
            make.leading.width.equalToSuperview()
            make.height.equalTo(Elements.textField.size.height)
        }
    }
}
