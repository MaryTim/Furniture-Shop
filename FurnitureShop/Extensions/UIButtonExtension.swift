//
//  UIButtonExtension.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/24/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func setBackgroundColor(color: UIColor, forState: UIControl.State) {
        self.clipsToBounds = true
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
            let colorImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            self.setBackgroundImage(colorImage, for: forState)
        }
    }
}

extension UIButton {
    func changeButtonAppearance() {
        if self.isSelected == true {
            self.layer.borderWidth = 3
        } else if self.isSelected == false {
            self.layer.borderWidth = 1
        }
    }
}
