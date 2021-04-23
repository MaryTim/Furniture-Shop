//
//  String+Extension.swift
//  FurnitureShop
//
//  Created by Maryia Budkevich on 29.03.21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func toImage() -> UIImage? {
        if let data = Data(base64Encoded: self, options: .ignoreUnknownCharacters){
            return UIImage(data: data)
        }
        return nil
    }
}
