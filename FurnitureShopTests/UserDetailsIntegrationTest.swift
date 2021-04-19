//
//  UserDetailsIntegrationTest.swift
//  FurnitureShopTests
//
//  Created by Maria Budkevich on 4/14/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import XCTest

class UserDetailsIntegrationTest: XCTestCase {

    var userDetailsVC: UserDetailsViewController!
    var userDetailsVM: UserDetailsViewModel!
    
    override func setUp() {
        super.setUp()
        userDetailsVM = UserDetailsViewModel()
        userDetailsVC = UserDetailsViewController()
    }

    func test_firstNameLabel_text() {
        userDetailsVC.viewDidLoad()
        let existingData = userDetailsVC.userDetails.nameLabel.text!
        let expectedData = "FIRST NAME"
        
        XCTAssertEqual(existingData, expectedData)
    }
    
    func test_surnameLabel_text() {
        userDetailsVC.viewDidLoad()
        let existingData = userDetailsVC.userDetails.surnameLabel.text!
        let expectedData = "SURNAME"
        
        XCTAssertEqual(existingData, expectedData)
    }
    
    func test_birthDateLabel_text() {
        userDetailsVC.viewDidLoad()
        let existingData = userDetailsVC.userDetails.birthDateLabel.text!
        let expectedData = "DATE OF BIRTH"
        
        XCTAssertEqual(existingData, expectedData)
    }
    
    func test_emailLabel_text() {
        userDetailsVC.viewDidLoad()
        let existingData = userDetailsVC.userDetails.emailLabel.text!
        let expectedData = "EMAIL ADDRESS"
        
        XCTAssertEqual(existingData, expectedData)
    }
    
    func test_buttonLabel_text() {
        userDetailsVC.viewDidLoad()
        let existingData = userDetailsVC.saveChangesButton.currentTitle!
        let expectedData = "SAVE CHANGES"
        
        XCTAssertEqual(existingData, expectedData)
    }
}
