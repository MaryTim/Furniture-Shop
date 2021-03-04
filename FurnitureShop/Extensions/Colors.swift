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
    case greetingUser
    case mainLabel
    case categoryButton
    case priceHomeVC
    case cartLabel
    case cartItemName
    case cartPrice
    case cartPlusMinusButtons
    case totalPrice
    case checkoutButtonBackground
    case saveChangesButton
    case saveChangesTapped
    case itemLabelItemVC
    case priceItemVC
    case description
    case cartButtonTappedBackground
    case cancelSignoutBorders
    case signoutCancelTapped
}

extension MyColor {
    var value: UIColor {
        get {
            switch self {
            case .greetingUser, .priceHomeVC:
                return UIColor(red: 111/255, green: 108/255, blue: 110/255, alpha: 0.8)
            case .mainLabel, .cartLabel, .cartPrice, .itemLabelItemVC, .description:
                return UIColor.black
            case .categoryButton, .cartItemName, .cartPlusMinusButtons, .totalPrice:
                return UIColor(red: 111/255, green: 108/255, blue: 110/255, alpha: 1)
            case .checkoutButtonBackground:
                return UIColor(red: 204/255, green: 197/255, blue: 188/255, alpha: 0.9)
            case .saveChangesButton:
                return UIColor(red: 204/255, green: 197/255, blue: 188/255, alpha: 1)
            case .saveChangesTapped, .priceItemVC, .cancelSignoutBorders:
                return UIColor(red: 111/255, green: 108/255, blue: 110/255, alpha: 1)
            case .cartButtonTappedBackground:
                return UIColor.gray
            case .signoutCancelTapped:
                return UIColor(red: 111/255, green: 108/255, blue: 110/255, alpha: 0.2)
            }
        }
    }
}
