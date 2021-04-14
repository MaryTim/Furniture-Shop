//
//  AccountIntegrationTests.swift
//  FurnitureShopTests
//
//  Created by Maria Budkevich on 4/14/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import XCTest

class AccountIntegrationTests: XCTestCase {

    var userVC: UserViewController!
    
    override func setUp() {
        super.setUp()
        userVC = UserViewController()
    }
    
    func test_categoriesQuantity() {
        userVC.viewDidLoad()
        let existingData = userVC.accountVM.categoriesArray.count
        let expectedData = 4
        
        XCTAssertEqual(existingData, expectedData)
    }
    
    func test_categoryName_0() {
        userVC.viewDidLoad()
        let existingData = userVC.accountVM.categoriesArray[0].name
        let expectedData = "My details"
        
        XCTAssertEqual(existingData, expectedData)
    }
    
    func test_categoryName_1() {
         userVC.viewDidLoad()
         let existingData = userVC.accountVM.categoriesArray[1].name
         let expectedData = "Address"
         
         XCTAssertEqual(existingData, expectedData)
     }
    
    func test_categoryName_2() {
         userVC.viewDidLoad()
         let existingData = userVC.accountVM.categoriesArray[2].name
         let expectedData = "Payment"
         
         XCTAssertEqual(existingData, expectedData)
     }
    
    func test_categoryName_3() {
           userVC.viewDidLoad()
           let existingData = userVC.accountVM.categoriesArray[3].name
           let expectedData = "Sign out"
           
           XCTAssertEqual(existingData, expectedData)
       }
}
