//
//  UIDevice.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 3/3/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import Foundation
import UIKit

public extension UIDevice {
    enum DeviceRange {
        case iPhoneClassic, iPhone4, iPhone5, iPhone8, iPhone6Plus, iPhone8Plus, iPhoneXR, iPhoneX, iPhoneXSMax, iPad, notDefined
    }
    
    enum LayoutBucket {
        case big, small, extraSmall
    }

//    static var isZoomed: Bool {
//        if UIScreen.main.bounds.size.height == 667.0 {
//            return !(UIScreen.main.nativeScale <= UIScreen.main.scale)
//        }
//        if  UIScreen.main.bounds.size.height == 568.0 {
//            return UIScreen.main.nativeScale > UIScreen.main.scale
//        }
//        return false
//    }

    static var currentDevice: DeviceRange {
        if UIDevice.current.userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 480:
                return .iPhoneClassic
            case 960:
                return .iPhone4
            case 1136:
                return .iPhone5
            case 1334:
                return .iPhone8
            case 1792:
                return .iPhoneXR
            case 1920:
                return .iPhone8Plus
                // iphone 6plus 1920???
            case 2208:
                return .iPhone6Plus
            case 2436:
                return .iPhoneX
            case 2688:
                return .iPhoneXSMax
            default:
                return .notDefined
            }
        } else {
            return .iPad
        }
    }

    static var layoutBucket: LayoutBucket {
        switch UIDevice.currentDevice {
        case .iPhoneClassic, .iPhone4:
            return .extraSmall
        case .iPhone5:
            return .small
        default:
            return .big
        }
    }

    static var isFrameLess: Bool {
        switch UIDevice.currentDevice {
        case .iPhoneClassic, .iPhone4, .iPhone5, .iPhone8, .iPhone6Plus:
            return false
        default:
            return true
        }
    }
}
