//
//  TapGesture.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 3/16/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
  func addTapGesture(tapNumber: Int, target: Any, action: Selector) {
    let tap = UITapGestureRecognizer(target: target, action: action)
    tap.numberOfTapsRequired = tapNumber
    addGestureRecognizer(tap)
    isUserInteractionEnabled = true
  }
}
