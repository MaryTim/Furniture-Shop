//
//  AddressViewController.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/19/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import UIKit

class AddressViewController: UIViewController {

    let addressVM = AddressViewModel()
    let addressInfo = AddressView()
    let saveChangesButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    func setupUI() {
        self.title = "My Address"
        addressInfo.city.delegate = self
        addressInfo.addressTextField.delegate = self
        addressInfo.postcodeTextField.delegate = self
        addressInfo.country.delegate = self
        addressInfo.country.dataSource = self
        view.backgroundColor = .white
        saveChangesButton.setTitle("Save changes".uppercased(), for: .normal)
        saveChangesButton.backgroundColor = MyColor.silverRust1.value
        saveChangesButton.setBackgroundColor(color: MyColor.fedora1.value, forState: .highlighted)
        view.addSubview(addressInfo)
        view.addSubview(saveChangesButton)
        bind()
    }
    
    func bind() {
        // Outputs
        addressInfo.countryLabel.text = addressVM.countryLabelText.uppercased()
        addressInfo.cityLabel.text = addressVM.cityLabelText.uppercased()
        addressInfo.addressLabel.text = addressVM.addressLabelText.uppercased()
        addressInfo.postcodeLabel.text = addressVM.postcodeLabelText.uppercased()
        
        // Inputs
        saveChangesButton.addTarget(self, action: #selector(savePressed), for: .touchUpInside)
    }
    
    func setupConstraints() {
        addressInfo.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(68)
            make.bottom.equalToSuperview().offset(-100)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-20)
        }
        saveChangesButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-100)
            make.height.equalTo(Elements.saveButton.size.height)
            make.centerX.equalToSuperview()
            make.width.equalTo(Elements.saveButton.size.width)
        }
    }
    
    @objc func savePressed(sender: UIButton!) {
        addressVM.saveButtonPressed()
    }
}

extension AddressViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return addressVM.countriesArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return addressVM.countriesArray[row]
    }
}

extension AddressViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           print("User's info is \(textField.text!)")
           textField.endEditing(true)
           return true
       }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        let tuple = addressVM.isEndEditing(text: textField.text ?? "")
        textField.placeholder = tuple.placeholder
        return tuple.shouldEndEditing
    }
    // use realm to save data?
}
