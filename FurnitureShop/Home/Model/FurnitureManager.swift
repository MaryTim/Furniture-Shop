//
//  FurnitureManager.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 3/1/21.
//  Copyright © 2021 Mary Tim. All rights reserved.

import Foundation
import UIKit

protocol ReturnDataDelegate: class {
    func returnData(data: FurnitureData)
}

class FurnitureManager {
    
    var delegate: ReturnDataDelegate?
    let urlString = "https://raw.githubusercontent.com/linadevray/furnitureAppJson/master/furnitureAPI.json"
    
    func performRequest() {
        if let url = URL(string: self.urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    do {
                        let furnitureData = try JSONDecoder().decode(FurnitureData.self, from: safeData)
                        self.delegate?.returnData(data: furnitureData)
                    } catch {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
}
