//
//  FurnitureShopTests.swift
//  FurnitureShopTests
//
//  Created by Maria Budkevich on 3/24/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import XCTest

class FurnitureShopTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCategoriesSorting() throws {
        var categoriesArray = ["bed", "kitchen", "table", "armchair", "lamp", "clock"]
        let expectedArray = ["armchair", "bed", "clock", "kitchen", "lamp", "table"]
        let sorted = categoriesArray.sorted()
        XCTAssertEqual(sorted, expectedArray)
    }

}
