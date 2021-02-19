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
    
    let date = [["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
    ["2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023", "2024", "2025", "2026", "2027", "2028", "2029", "2030"]]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        datePicker.delegate = self
        datePicker.dataSource = self
        cardTextField.delegate = self
        nameTextField.delegate = self
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        cardLabel.text = "CARD NUMBER"
        cardImage.image = UIImage(systemName: "creditcard")
        cardImage.tintColor = .black
        cardTextField.borderStyle = .roundedRect
        cardTextField.returnKeyType = .done
        cardTextField.keyboardType = .numberPad // add done button
        datePicker.selectRow(5, inComponent: 0, animated: false)
        datePicker.selectRow(10, inComponent: 1, animated: false)
        dateLabel.text = "EXPIRY DATE"
        cardNameLabel.text = "NAME ON CARD"
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
            make.height.equalTo(25)
        }
        cardImage.snp.makeConstraints { (make) in
            make.top.equalTo(cardLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(40)
        }
        cardTextField.snp.makeConstraints { (make) in
            make.leading.equalTo(cardImage.snp.trailing).offset(15)
            make.trailing.equalToSuperview()
            make.top.equalTo(cardLabel.snp.bottom).offset(10)
            make.height.equalTo(30)
        }
        dateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(cardTextField.snp.bottom).offset(20)
            make.leading.width.equalToSuperview()
            make.height.equalTo(25)
        }
        datePicker.snp.makeConstraints { (make) in
            make.top.equalTo(dateLabel.snp.bottom).offset(10)
            make.leading.width.equalToSuperview()
            make.height.equalTo(150)
        }
        cardNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(datePicker.snp.bottom).offset(10)
            make.leading.width.equalToSuperview()
            make.height.equalTo(25)
        }
        nameTextField.snp.makeConstraints { (make) in
            make.top.equalTo(cardNameLabel.snp.bottom).offset(10)
            make.leading.width.equalToSuperview()
            make.height.equalTo(30)
        }
    }
}

extension PaymentView: UITextFieldDelegate {
    
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
    
    // use firebase to save data?
}

extension PaymentView: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return date[component].count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return date[component][row]
    }
}
