//
//  PaymentIntegrationTest.swift
//  FurnitureShopTests
//
//  Created by Maria Budkevich on 4/7/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import XCTest

class PaymentIntegrationTest: XCTestCase {

    var paymentVC: PaymentViewController!
    var paymentVM: PaymentViewModel!
    
    override func setUp() {
        super.setUp()
        
        paymentVM = PaymentViewModel()
        paymentVC = PaymentViewController()
    }
    
    func test_cardNumberLabel_text() {
        paymentVC.viewDidLoad()
        let existingData = paymentVC.paymentInfo.cardLabel.text
        let expectedData = "CARD NUMBER"
        
        XCTAssertEqual(existingData, expectedData)
    }
    
    func test_expiryDateLabel_text() {
        paymentVC.viewDidLoad()
        let existingData = paymentVC.paymentInfo.dateLabel.text
        let expectedData = "EXPIRY DATE"
        
        XCTAssertEqual(existingData, expectedData)
    }
    
    func test_acceptedCardsLabel_text() {
        paymentVC.viewDidLoad()
        let existingData = paymentVC.cardsInfo.acceptLabel.text
        let expectedData = "WE ACCEPT"
        
        XCTAssertEqual(existingData, expectedData)
    }
    
    func test_cardNameLabel_text() {
        paymentVC.viewDidLoad()
        let existingData = paymentVC.paymentInfo.cardNameLabel.text
        let expectedData = "NAME ON CARD"
        
        XCTAssertEqual(existingData, expectedData)
    }
    
    func test_saveCardButton_label() {
        paymentVC.viewDidLoad()
        let existingData = paymentVC.saveCard.titleLabel!.text
        let expectedData = "SAVE CARD"
        
        XCTAssertEqual(existingData, expectedData)
    }
}
