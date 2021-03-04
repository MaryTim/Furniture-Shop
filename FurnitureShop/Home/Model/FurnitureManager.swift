//
//  FurnitureManager.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 3/1/21.
//  Copyright © 2021 Mary Tim. All rights reserved.

import Foundation
import UIKit
import ObjectMapper

protocol ReturnDataDelegate {
    var categories: [Categories] {get set}
    //func returnData(data: FurnitureData)
}

class FurnitureManager {
    
    let urlString = "https://raw.githubusercontent.com/linadevray/furnitureAppJson/master/furnitureAPI.json"
    var delegate: ReturnDataDelegate?
    
    func performRequest() {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    do {
                        let dataString = String(data: safeData, encoding: .utf8)
                        let furnitureData = try JSONDecoder().decode(FurnitureData.self, from: safeData)
                        print(furnitureData)
                        self.delegate?.categories = furnitureData.categories
                    } catch {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
}
