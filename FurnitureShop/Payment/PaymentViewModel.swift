//
//  PaymentViewModel.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 4/7/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import Foundation

class PaymentViewModel {
    
    let saveCardButtonText = "save card"
    let date = [["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
       ["2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023", "2024", "2025", "2026", "2027", "2028", "2029", "2030"]]
    let cardNumberLabelText = "card number"
    let cardPicName = "creditcard"
    let expiryDateLabelText = "expiry date"
    let cardNameLabelText = "name on card"
    let acceptedCardsLabelText = "we accept"
    let paypalImageName = "paypal"
    let mastercardImageName  = "mastercard"
    let visaImageName = "visa"
    
    func saveButtonPressed() {
           print("User saved payment details")
       }
}
