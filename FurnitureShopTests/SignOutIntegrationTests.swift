//
//  SignOutIntegrationTests.swift
//  FurnitureShopTests
//
//  Created by Maria Budkevich on 4/13/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import XCTest

class SignOutIntegrationTests: XCTestCase {

    var signoutVC: SignOutViewController!
    var signoutVM: SignoutViewModel!
    
    override func setUp() {
        super.setUp()
        
        signoutVM = SignoutViewModel()
        signoutVC = SignOutViewController()
    }
    
    func test_questionLabelText() {
        signoutVC.viewDidLoad()
        let existingData = signoutVC.questionLabel.text
        let expectedData = "Are you sure you want to sign out?"
        
        XCTAssertEqual(existingData, expectedData)
    }
    
    func test_yesButtonLabel() {
        signoutVC.viewDidLoad()
        let existingData = signoutVC.yesButton.currentTitle!
        let expectedData = "Sign out"
        
        XCTAssertEqual(existingData, expectedData)
    }
    
    func test_cancelButtonLabel() {
        signoutVC.viewDidLoad()
        let existingData = signoutVC.cancelButton.currentTitle!
        let expectedData = "Cancel"
        
        XCTAssertEqual(existingData, expectedData)
    }
}
