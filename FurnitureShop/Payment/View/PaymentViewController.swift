//
//  PaymentViewController.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/19/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {
    
    let paymentVM = PaymentViewModel()
    let paymentInfo = PaymentView()
    let saveCard = UIButton()
    let cardsInfo = AcceptedCards()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    func setupUI() {
        self.title = "Credit Card"
        paymentInfo.cardTextField.delegate = self
        paymentInfo.nameTextField.delegate = self
        paymentInfo.datePicker.delegate = self
        paymentInfo.datePicker.dataSource = self
        view.backgroundColor = .white
        saveCard.setTitle(paymentVM.saveCardButtonText.uppercased(), for: .normal)
        saveCard.backgroundColor = MyColor.silverRust1.value
        saveCard.setBackgroundColor(color: MyColor.fedora1.value, forState: .highlighted)
        view.addSubview(paymentInfo)
        view.addSubview(saveCard)
        view.addSubview(cardsInfo)
        bind()
    }
    
    func bind() {
        // Outputs
        paymentInfo.datePicker.selectRow(5, inComponent: 0, animated: false)
        paymentInfo.datePicker.selectRow(10, inComponent: 1, animated: false)
        paymentInfo.cardLabel.text = paymentVM.cardNumberLabelText.uppercased()
        paymentInfo.cardImage.image = UIImage(systemName: paymentVM.cardPicName)
        paymentInfo.dateLabel.text = paymentVM.expiryDateLabelText.uppercased()
        paymentInfo.cardNameLabel.text = paymentVM.cardNameLabelText.uppercased()
        cardsInfo.acceptLabel.text = paymentVM.acceptedCardsLabelText.uppercased()
        cardsInfo.mastercard.image = UIImage(named: paymentVM.mastercardImageName)
        cardsInfo.visa.image = UIImage(named: paymentVM.visaImageName)
        cardsInfo.paypal.image = UIImage(named: paymentVM.paypalImageName)
        
        // Inputs
        saveCard.addTarget(self, action: #selector(savePressed), for: .touchUpInside)
    }
    
    @objc func savePressed(sender: UIButton!) {
           paymentVM.saveButtonPressed()
       }
    
    func setupConstraints() {
        paymentInfo.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(68)
            make.bottom.equalToSuperview().offset(-300)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-20)
        }
        saveCard.snp.makeConstraints { (make) in
            make.bottom.equalTo(cardsInfo.snp.top).offset(-Spaces.medium.size)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(180)
        }
        cardsInfo.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-60)
            make.top.equalTo(saveCard.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(10)
            make.width.equalToSuperview()
            make.height.equalTo(40)
        }
    }
}

extension PaymentViewController: UITextFieldDelegate {
    
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
    // use Realm to save data?
}

extension PaymentViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return paymentVM.date[component].count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return paymentVM.date[component][row]
    }
}
