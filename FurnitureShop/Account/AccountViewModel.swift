//
//  AccountViewModel.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 4/14/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import Foundation
import UIKit

class AccountViewModel {

    let categoriesArray = [UserInfoCategory(name: "My details", categoryIcon: UIImage(systemName: "person.crop.rectangle")!),
        UserInfoCategory(name: "Address", categoryIcon: UIImage(systemName: "house")!),
           UserInfoCategory(name: "Payment", categoryIcon: UIImage(systemName: "creditcard")!),
           UserInfoCategory(name: "Sign out", categoryIcon: UIImage(systemName: "arrow.down.to.line.alt")!)
       ]
}
