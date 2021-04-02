//
//  Results+Extension.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 4/2/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import Foundation
import RealmSwift

extension Results {
   func toArray() -> [Element] {
     return compactMap {
       $0
     }
   }
}
