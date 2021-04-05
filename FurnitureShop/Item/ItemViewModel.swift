//
//  ItemViewModel.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 4/2/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import Foundation

class ItemViewModel: ReturnDataDelegate {
    
    let manager = FurnitureManager()
    var categories: [Categories]?
    
    init() {
        manager.delegate = self
    }
    
    func returnData(data: FurnitureData) {
        categories = data.categories
    }
    
    var itemName: String {
        return categories?[0].name ?? ""
    }
    
    func dataForVC() {
        
    }
    
}
