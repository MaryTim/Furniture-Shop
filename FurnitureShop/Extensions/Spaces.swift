//
//  Spaces.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 3/4/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import Foundation
import UIKit

public enum Spaces {
    case big
    case medium
    case small
    case tiny
    
    public var size: CGFloat {
        switch self {
        case .big:
            switch UIDevice.layoutBucket {
            case .big:
                return CGFloat(32.0)
            case .small:
                return CGFloat(24.0)
            case .extraSmall:
                return CGFloat(16.0)
            }
            
        case .medium:
            switch UIDevice.layoutBucket {
            case .big:
                return CGFloat(24.0)
            case .small:
                return CGFloat(16.0)
            case .extraSmall:
                return CGFloat(16.0)
            }
            
        case .small:
            switch UIDevice.layoutBucket {
            case .big:
                return CGFloat(16.0)
            case .small:
                return CGFloat(16.0)
            case .extraSmall:
                return CGFloat(8.0)
            }
            
        case .tiny:
            switch UIDevice.layoutBucket {
            case .big:
                return CGFloat(8.0)
            case .small:
                return CGFloat(8.0)
            case .extraSmall:
                return CGFloat(8.0)
            }
        }
    }
}
