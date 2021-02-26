//
//  PaymentViewController.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/19/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {

    let paymentV = PaymentView()
    let saveCard = UIButton()
    let cardsView = AcceptedCards()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }

    @objc func saveCardPressed(sender: UIButton!) {
        print("User's card is saved")
    }
    
    func setupUI() {
        self.title = "Credit Card"
        view.backgroundColor = .white
        saveCard.addTarget(self, action: #selector(saveCardPressed), for: .touchUpInside)
        saveCard.setTitle("SAVE CARD", for: .normal)
        saveCard.backgroundColor = UIColor(red: 204/255, green: 197/255, blue: 188/255, alpha: 1)
        saveCard.setBackgroundColor(color: UIColor(red: 111/255, green: 108/255, blue: 110/255, alpha: 1), forState: .highlighted)
        view.addSubview(paymentV)
        view.addSubview(saveCard)
        view.addSubview(cardsView)
    }
    
    func setupConstraints() {
        paymentV.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(68)
            make.bottom.equalToSuperview().offset(-300)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-20)
        }
        saveCard.snp.makeConstraints { (make) in
            make.top.equalTo(paymentV.snp.bottom).offset(50)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(180)
        }
        cardsView.snp.makeConstraints { (make) in
            make.top.equalTo(saveCard.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(10)
            make.width.equalToSuperview()
            make.height.equalTo(40)
        }
    }
}
