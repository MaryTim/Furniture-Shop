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
    let countriesArray = ["🇦🇺 Australia", "🤍❤️🤍 Belarus", "🇫🇷 France", "🇩🇪 Germany", "🇮🇹 Italy", "🇵🇱 Poland", "🇷🇺 Russia", "🇪🇸 Spain", "🇸🇪 Sweden", "🇬🇧 UK", "🇺🇸 United States"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        city.delegate = self
        addressTextField.delegate = self
        postcodeTextField.delegate = self
        country.delegate = self
        country.dataSource = self
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        countryLabel.text = "COUNTRY"
        cityLabel.text = "CITY/TOWN"
        addressLabel.text = "ADDRESS"
        postcodeLabel.text = "POSTCODE"
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
            make.height.equalTo(25)
        }
        country.snp.makeConstraints { (make) in
            make.top.equalTo(countryLabel.snp.bottom).offset(Spaces.tiny.size)
            make.leading.width.equalToSuperview()
            make.height.equalTo(150)
        }
        cityLabel.snp.makeConstraints { (make) in
            make.top.equalTo(country.snp.bottom).offset(Spaces.tiny.size)
            make.leading.width.equalToSuperview()
            make.height.equalTo(25)
        }
        city.snp.makeConstraints { (make) in
            make.top.equalTo(cityLabel.snp.bottom).offset(Spaces.tiny.size)
            make.leading.width.equalToSuperview()
            make.height.equalTo(30)
        }
        addressLabel.snp.makeConstraints { (make) in
            make.top.equalTo(city.snp.bottom).offset(Spaces.tiny.size)
            make.leading.width.equalToSuperview()
            make.height.equalTo(25)
        }
        addressTextField.snp.makeConstraints { (make) in
            make.top.equalTo(addressLabel.snp.bottom).offset(Spaces.tiny.size)
            make.leading.width.equalToSuperview()
            make.height.equalTo(30)
        }
        postcodeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(addressTextField.snp.bottom).offset(Spaces.tiny.size)
            make.leading.width.equalToSuperview()
            make.height.equalTo(25)
        }
        postcodeTextField.snp.makeConstraints { (make) in
            make.top.equalTo(postcodeLabel.snp.bottom).offset(Spaces.tiny.size)
            make.leading.width.equalToSuperview()
            make.height.equalTo(30)
        }
    }
}

extension AddressView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countriesArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countriesArray[row]
    }
}

extension AddressView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           print("User's info is \(textField.text!)")
           textField.endEditing(true)
           return true
       }
       
       func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
           if textField.text != "" {
               return true
           } else {
            textField.placeholder = "You need to enter your data"
               return false
           }
       }
    // use realm to save data?
}
