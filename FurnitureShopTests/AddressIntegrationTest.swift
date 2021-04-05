//
//  AddressIntegrationTest.swift
//  FurnitureShopTests
//
//  Created by anhelina.mamekhina on 4/5/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import XCTest

class AddressIntegrationTest: XCTestCase {
    
    var addressVM: AddressViewModel!
    var addressVC: AddressViewController!

    override func setUp() {
        super.setUp()

        addressVM = AddressViewModel()
        addressVC = AddressViewController()
    }
    
    func test_address_label_text() {
        let existingData = addressVM.addressLabelText
        let expectedData = "Address"
        
        XCTAssertEqual(existingData, expectedData)
    }
    
    func test_vc_address_label_text() {
        addressVC.viewDidLoad()
        let existingData = addressVC.addressInfo.addressLabel.text
        let expectedData = "ADDRESS"
        
        XCTAssertEqual(existingData, expectedData)
    }
}
