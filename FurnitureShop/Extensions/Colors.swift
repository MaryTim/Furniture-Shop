//
//  Colors.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 3/3/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import Foundation
import UIKit

enum MyColor {
    case fedora08
    case fedora1
    case silverRust09
    case silverRust1
    case fedora02
}

extension MyColor {
    var value: UIColor {
        get {
            switch self {
            case .fedora08:
                return UIColor(red: 111/255, green: 108/255, blue: 110/255, alpha: 0.8)
            case .fedora1:
                return UIColor(red: 111/255, green: 108/255, blue: 110/255, alpha: 1)
            case .silverRust09:
                return UIColor(red: 204/255, green: 197/255, blue: 188/255, alpha: 0.9)
            case .silverRust1:
                return UIColor(red: 204/255, green: 197/255, blue: 188/255, alpha: 1)
            case .fedora02:
                return UIColor(red: 111/255, green: 108/255, blue: 110/255, alpha: 0.2)
            }
        }
    }
}
