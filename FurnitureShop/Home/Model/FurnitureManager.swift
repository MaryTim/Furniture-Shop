//
//  FurnitureManager.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 3/1/21.
//  Copyright © 2021 Mary Tim. All rights reserved.


import Foundation
import UIKit

//protocol FurnitureManagerDelegate {
//    func didUpdateFurniture(furniture: FurnitureModel)
//}

class FurnitureManager {
    
    let urlString = "https://raw.githubusercontent.com/linadevray/furnitureAppJson/master/furnitureAPI.json"
    var furnitureData: FurnitureData?
    
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
                        self.furnitureData = try JSONDecoder().decode(FurnitureData.self, from: safeData)
                        
                        print(self.furnitureData?.categories.count)
                    } catch {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
    
//    func parseJSON(furnitureData: Data) -> FurnitureData? {
//        let decoder = JSONDecoder()
//        do {
//            let decodedData = try decoder.decode(FurnitureData.self, from: furnitureData)
//            print(decodedData)
//            return decodedData
//        } catch {
//            print(error)
//            return nil
//        }
//    }
    
}
