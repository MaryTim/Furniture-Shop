//
//  SignoutViewModel.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 4/13/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import Foundation

class SignoutViewModel {
    
    let qustionLabelText = "Are you sure you want to sign out?"
    let signOutButtonLabel = "Sign out"
    let cancelButtonLabel = "Cancel"
    
    func signOutButtonPressed() {
        print("User wants to sign out! Do smth with it")
    }
    func cancelButtonPressed() {
        print("User wants to stay signed in")
    }
}
