//
//  FurnitureData.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 3/1/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import Foundation

struct FurnitureData: Codable {
    var categories: [Categories]
}

struct Categories: Codable {
    var type: String
    var name: String
    var price: Int
    var colors: [Colors]
    var description: String
}

struct Colors: Codable {
    var buttonColor: String?
    var itemPic: String
}
