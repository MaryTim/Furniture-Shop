//
//  UIImage+Extension.swift
//  FurnitureShop
//
//  Created by Maryia Budkevich on 29.03.21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func toString() -> String? {
        let data: Data? = self.pngData()
        return data?.base64EncodedString(options: .endLineWithLineFeed)
    }
}
