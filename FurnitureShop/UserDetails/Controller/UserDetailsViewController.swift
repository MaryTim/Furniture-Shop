//
//  UserDetailsViewController.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/19/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import UIKit
import SnapKit

class UserDetailsViewController: UIViewController {
    
    let userDetails = UserDetailsView()
    let saveChangesButton = UIButton()
    let userDetailsVM = UserDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userDetails.nameTextField.delegate = self
        userDetails.surnameTextField.delegate = self
        userDetails.email.delegate = self
        setupUI()
        setupConstraints()
        bind()
    }
    
    func bind() {
        userDetails.nameLabel.text = userDetailsVM.firstNameLabelText.uppercased()
        userDetails.surnameLabel.text = userDetailsVM.surnameLabelText.uppercased()
        userDetails.emailLabel.text = userDetailsVM.emailLabelText.uppercased()
        userDetails.birthDateLabel.text = userDetailsVM.birthDateLabelText.uppercased()
    }
    
    @objc func savePressed(sender: UIButton!) {
        userDetailsVM.saveButtonPressed()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        self.title = "My Details"
        saveChangesButton.setTitle(userDetailsVM.buttonLabel.uppercased(), for: .normal)
        saveChangesButton.backgroundColor = MyColor.silverRust1.value
        saveChangesButton.addTarget(self, action: #selector(savePressed), for: .touchUpInside)
        saveChangesButton.setBackgroundColor(color: MyColor.fedora1.value, forState: .highlighted)
        view.addSubview(userDetails)
        view.addSubview(saveChangesButton)
    }
    
    func setupConstraints() {
        userDetails.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(68)
            make.bottom.equalToSuperview().offset(-100)
            make.leading.equalToSuperview().offset(Spaces.tiny.size)
            make.trailing.equalToSuperview().offset(-20)
        }
        saveChangesButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-100)
            make.height.equalTo(Elements.saveButton.size.height)
            make.centerX.equalToSuperview()
            make.width.equalTo(Elements.saveButton.size.width)
        }
    }
}

extension UserDetailsViewController: UITextFieldDelegate {
    
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
