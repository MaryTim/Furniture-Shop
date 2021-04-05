//
//  AddressViewModel.swift
//  FurnitureShop
//
//  Created by anhelina.mamekhina on 4/5/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import Foundation

class AddressViewModel {

    let saveChangesButtonText = "Save changes"
    let countriesArray = ["🇦🇺 Australia", "🤍❤️🤍 Belarus", "🇫🇷 France", "🇩🇪 Germany", "🇮🇹 Italy", "🇵🇱 Poland", "🇷🇺 Russia", "🇪🇸 Spain", "🇸🇪 Sweden", "🇬🇧 UK", "🇺🇸 United States"]
    let countryLabelText = "Country"
    let cityLabelText = "City/town"
    let addressLabelText = "Address"
    let postcodeLabelText = "Postcode"
    
    func saveButtonPressed() {
        print("User saved the address data")
    }
    
    func isEndEditing(text: String) -> (shouldEndEditing: Bool, placeholder: String) {
        if text != "" {
            return (true, "")
        } else {
            return (false, "You need to enter your data")
        }
    }
}
