//
//  FurnitureManager.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 3/1/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import Foundation
import UIKit

struct FurnitureManager {
    
    let urlString = "https://raw.githubusercontent.com/linadevray/furnitureAppJson/master/furnitureAPI.json"
    
    func performRequest() {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                }
                if let safeData = data {
                    self.parseJSON(fdata: safeData)
                }
            }
            task.resume()
        }
        
    }
    
    func parseJSON(fdata: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(FurnitureData.self, from: fdata)
            print(decodedData.categories[0].sofa[0].description)
        } catch {
            print(error)
        }
    }
}

