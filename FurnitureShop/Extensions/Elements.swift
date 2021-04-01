//
//  Elements.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 3/26/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import Foundation
import UIKit

public enum Elements {
    case saveButton
    case textField
    case textFieldLabel
    case itemPic
    case info
    case label
    case plusMinusButton
    case pictureInACell
    case nameInACell
    case sumInACell
    case cell
    
    public var size: CGSize {
        switch self {
        case .saveButton:
            return CGSize(width: 180, height: 40)
        case .textField:
            return CGSize(width: 0, height: 30)
        case .textFieldLabel:
            return CGSize(width: 0, height: 25)
        case .itemPic:
            switch UIDevice.layoutBucket {
            case .big:
                return CGSize(width: 0, height: 300)
            case .small:
                return CGSize(width: 0, height: 250)
            case .extraSmall:
                return CGSize(width: 0, height: 220)
            }
        case .info:
            switch UIDevice.layoutBucket {
            case .big:
                return CGSize(width: 0, height: 300)
            case .small:
                return CGSize(width: 0, height: 230)
            case .extraSmall:
                return CGSize(width: 0, height: 190)
            }
        case .label:
            switch UIDevice.layoutBucket {
            case .big:
                return CGSize(width: 0, height: 60)
            case .small:
                return CGSize(width: 0, height: 55)
            case .extraSmall:
                return CGSize(width: 0, height: 40)
            }
        case .plusMinusButton:
            return CGSize(width: 25, height: 35)
        case .pictureInACell:
            switch UIDevice.layoutBucket {
            case .big:
                return CGSize(width: 100, height: 100)
            case .small:
                return CGSize(width: 85, height: 85)
            case .extraSmall:
                return CGSize(width: 70, height: 70)
            }
        case .nameInACell:
            switch UIDevice.layoutBucket {
            case .big:
                return CGSize(width: 0, height: 50)
            case .small:
                return CGSize(width: 0, height: 40)
            case .extraSmall:
                return CGSize(width: 0, height: 32)
            }
        case .sumInACell:
            switch UIDevice.layoutBucket {
            case .big:
                return CGSize(width: 110, height: 35)
            case .small:
                return CGSize(width: 80, height: 25)
            case .extraSmall:
                return CGSize(width: 70, height: 20)
            }
        case .cell:
            switch UIDevice.layoutBucket {
            case .big:
                return CGSize(width: 0, height: 100)
            case .small:
                return CGSize(width: 0, height: 80)
            case .extraSmall:
                return CGSize(width: 0, height: 60)
            }
        }
    }
}
