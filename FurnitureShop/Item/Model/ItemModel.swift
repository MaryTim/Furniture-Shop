//
//  ItemModel.swift
//  FurnitureShop
//
//  Created by Maryia Budkevich on 29.03.21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import Foundation
import RealmSwift

class ItemModel: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var price: String = ""
    @objc dynamic var pic: String = ""
}

