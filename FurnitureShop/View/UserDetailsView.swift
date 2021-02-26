//
//  UserDetailsView.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/19/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class UserDetailView: UIView {
    
    let nameLabel = UILabel()
    let nameTextField = UITextField()
    let surnameLabel = UILabel()
    let surnameTextField = UITextField()
    let emailLabel = UILabel()
    let email = UITextField()
    let birthDateLabel = UILabel()
    let birthDate = UIDatePicker()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nameTextField.delegate = self
        surnameTextField.delegate = self
        email.delegate = self
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        nameLabel.text = "FIRST NAME"
        surnameLabel.text = "LAST NAME"
        emailLabel.text = "EMAIL ADDRESS"
        birthDateLabel.text = "DATE OF BIRTH"
        nameTextField.borderStyle = .roundedRect
        nameTextField.returnKeyType = .done
        surnameTextField.borderStyle = .roundedRect
        surnameTextField.returnKeyType = .done
        email.borderStyle = .roundedRect
        email.returnKeyType = .done
        email.keyboardType = .emailAddress
        birthDate.datePickerMode = .date
        birthDate.minimumDate = Calendar.current.date(byAdding: .year, value: -120, to: Date())
        birthDate.maximumDate = Calendar.current.date(byAdding: .year, value: 0, to: Date())
        addSubview(nameLabel)
        addSubview(nameTextField)
        addSubview(surnameLabel)
        addSubview(surnameTextField)
        addSubview(emailLabel)
        addSubview(email)
        addSubview(birthDateLabel)
        addSubview(birthDate)
    }
    
    func setupConstraints() {
        nameLabel.snp.makeConstraints { (make) in
            make.top.leading.width.equalToSuperview()
            make.height.equalTo(25)
        }
        nameTextField.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.leading.width.equalToSuperview()
            make.height.equalTo(30)
        }
        surnameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameTextField.snp.bottom).offset(10)
            make.leading.width.equalToSuperview()
            make.height.equalTo(25)
        }
        surnameTextField.snp.makeConstraints { (make) in
            make.top.equalTo(surnameLabel.snp.bottom).offset(10)
            make.leading.width.equalToSuperview()
            make.height.equalTo(30)
        }
        emailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(surnameTextField.snp.bottom).offset(10)
            make.leading.width.equalToSuperview()
            make.height.equalTo(25)
        }
        email.snp.makeConstraints { (make) in
            make.top.equalTo(emailLabel.snp.bottom).offset(10)
            make.leading.width.equalToSuperview()
            make.height.equalTo(30)
        }
        birthDateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(email.snp.bottom).offset(10)
            make.leading.width.equalToSuperview()
            make.height.equalTo(25)
        }
        birthDate.snp.makeConstraints { (make) in
            make.top.equalTo(birthDateLabel.snp.bottom).offset(10)
            make.leading.width.equalToSuperview()
            make.height.equalTo(150)
        }
    }
}


extension UserDetailView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           print("User's name is \(textField.text!)")
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
    // use Realm to save data?
}
