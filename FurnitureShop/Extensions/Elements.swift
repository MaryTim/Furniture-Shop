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
    case medium
    case big
    case small
    
    public var size: CGFloat {
        switch self {
        case .big:
            switch UIDevice.layoutBucket {
            case .big:
                return CGFloat(300)
            case .small:
                return CGFloat(230)
            case .extraSmall:
                return CGFloat(150)
            }
        case .medium:
            switch UIDevice.layoutBucket {
            case .big:
                return CGFloat(70.0)
            case .small:
                return CGFloat(40.0)
            case .extraSmall:
                return CGFloat(20.0)
            }
        case .small:
            switch UIDevice.layoutBucket {
            case .big:
                return CGFloat(70.0)
            case .small:
                return CGFloat(40.0)
            case .extraSmall:
                return CGFloat(20.0)
            }
        }
    }
}
