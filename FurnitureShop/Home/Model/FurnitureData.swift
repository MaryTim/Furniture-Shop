//
//  FurnitureData.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 3/1/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import Foundation
import ObjectMapper

struct FurnitureData: Codable, Mappable {
 
    
    
    var categories: [Categories]
    
    init?(map: Map) {
         
     }
     
     mutating func mapping(map: Map) {
         categories    <- map["categories"]
     }
}
    struct Categories: Codable, Mappable {
        var type: String
        var name: String
        var price: Int
        var colors: [Colors]
        var description: String
        
        init?(map: Map) {
            
        }
        
        mutating func mapping(map: Map) {
            type   <- map["type"]
            name   <- map["name"]
            price   <- map["price"]
            colors   <- map["colors"]
            description   <- map["description"]
        }
    }

    struct Colors: Codable {
        var buttonColor: String?
        var itemPic: String
        
        init?(map: Map) {
            
        }
        
        mutating func mapping(map: Map) {
            itemPic <- map["itemPic"]
        }
    }

let furnManager = FurnitureManager()
let categories = Categories(JSONString: furnManager.furnitureData?.categories ?? "empty")
