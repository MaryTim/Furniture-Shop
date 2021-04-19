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

class UserDetailsView: UIView {
    
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
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
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
            make.height.equalTo(Elements.textFieldLabel.size.height)
        }
        nameTextField.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(Spaces.tiny.size)
            make.leading.width.equalToSuperview()
            make.height.equalTo(Elements.textField.size.height)
        }
        surnameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameTextField.snp.bottom).offset(Spaces.tiny.size)
            make.leading.width.equalToSuperview()
            make.height.equalTo(Elements.textFieldLabel.size.height)
        }
        surnameTextField.snp.makeConstraints { (make) in
            make.top.equalTo(surnameLabel.snp.bottom).offset(Spaces.tiny.size)
            make.leading.width.equalToSuperview()
            make.height.equalTo(Elements.textField.size.height)
        }
        emailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(surnameTextField.snp.bottom).offset(Spaces.tiny.size)
            make.leading.width.equalToSuperview()
            make.height.equalTo(Elements.textFieldLabel.size.height)
        }
        email.snp.makeConstraints { (make) in
            make.top.equalTo(emailLabel.snp.bottom).offset(Spaces.tiny.size)
            make.leading.width.equalToSuperview()
            make.height.equalTo(Elements.textField.size.height)
        }
        birthDateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(email.snp.bottom).offset(Spaces.tiny.size)
            make.leading.width.equalToSuperview()
            make.height.equalTo(Elements.textFieldLabel.size.height)
        }
        birthDate.snp.makeConstraints { (make) in
            make.top.equalTo(birthDateLabel.snp.bottom).offset(Spaces.tiny.size)
            make.leading.width.equalToSuperview()
            make.height.equalTo(150)
        }
    }
}
