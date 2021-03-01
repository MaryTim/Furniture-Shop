//
//  FurnitureData.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 3/1/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import Foundation
import UIKit

struct FurnitureData: Codable {
    let categories: [Categories]
}

struct Categories: Codable {
    let sofa: [Sofa]
    let table: [Table]
    let mirror: [Mirror]
    let bed: [Bed]
    let chair: [Chair]
    let dresser: [Dresser]
    let bookcase: [Bookcase]
    let rug: [Rug]
    let lighting: [Lighting]
    let clock: [Clock]
}

struct Sofa: Codable {
    let name: String
    let price: Int
    let colors: [Colors]
    let description: String
}

struct Table: Codable {
    let name: String
    let price: Int
    let colors: [Colors]
    let description: String
}

struct Mirror: Codable {
    let name: String
    let price: Int
    let colors: [Colors]
    let description: String
}

struct Bed: Codable {
    let name: String
    let price: Int
    let colors: [Colors]
    let description: String
}

struct Chair: Codable {
    let name: String
    let price: Int
    let colors: [Colors]
    let description: String
}

struct Dresser: Codable {
    let name: String
    let price: Int
    let colors: [Colors]
    let description: String
}

struct Bookcase: Codable {
    let name: String
    let price: Int
    let colors: [Colors]
    let description: String
}

struct Rug: Codable {
    let name: String
    let price: Int
    let colors: [Colors]
    let description: String
}

struct Lighting: Codable {
    let name: String
    let price: Int
    let colors: [Colors]
    let description: String
}

struct Clock: Codable {
    let name: String
    let price: Int
    let colors: [Colors]
    let description: String
}

struct Colors: Codable {
    let buttonColor: String
    let itemPic: String
}
