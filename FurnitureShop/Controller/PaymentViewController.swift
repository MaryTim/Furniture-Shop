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
        view.backgroundColor = .white
        setupUI()
        setupConstraints()
        self.title = "Credit Card"
    }

    func setupUI() {
        saveCard.setTitle("SAVE CARD", for: .normal)
        saveCard.backgroundColor = UIColor(red: 204/255, green: 197/255, blue: 188/255, alpha: 1)
        view.addSubview(paymentV)
        view.addSubview(saveCard)
        view.addSubview(cardsView)
    }
    
    func setupConstraints() {
        paymentV.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(68)
            make.bottom.equalToSuperview().offset(-150)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-20)
        }
        saveCard.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-350)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(180)
        }
        cardsView.snp.makeConstraints { (make) in
            make.top.equalTo(saveCard.snp.bottom).offset(100)
            make.leading.equalToSuperview().offset(10)
            make.width.equalToSuperview()
            make.height.equalTo(40)
        }
    }
}
