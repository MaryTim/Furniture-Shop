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
    
    func test_countryLabel_text() {
        addressVC.viewDidLoad()
        let existingData = addressVC.addressInfo.countryLabel.text
        let expectedData = "COUNTRY"
        
        XCTAssertEqual(existingData, expectedData)
    }
    
    func test_cityLabel_text() {
        addressVC.viewDidLoad()
        let existingData = addressVC.addressInfo.cityLabel.text
        let expectedData = "CITY/TOWN"
        
        XCTAssertEqual(existingData, expectedData)
    }
    
    func test_postcodeLabel_text() {
        addressVC.viewDidLoad()
        let existingData = addressVC.addressInfo.postcodeLabel.text
        let expectedData = "POSTCODE"
        
        XCTAssertEqual(existingData, expectedData)
    }
    
    func test_saveChangesButton_label() {
        addressVC.viewDidLoad()
        let existingData = addressVC.saveChangesButton.title(for: .normal)!
        let expectedData = "SAVE CHANGES"
        
        XCTAssertEqual(existingData, expectedData)
    }
    
    func test_countiesArray() {
        addressVC.viewDidLoad()
        let existingData = addressVM.countriesArray.isEmpty
        
        XCTAssertFalse(existingData)
    }
}
