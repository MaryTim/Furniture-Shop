//
//  SearchViewController.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/16/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    let searchTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        setupUI()
        setupConstraints()
    }
    
    func setupUI() {
        searchTextField.borderStyle = .roundedRect
        searchTextField.adjustsFontSizeToFitWidth = true
        searchTextField.adjustsFontForContentSizeCategory = true
        searchTextField.attributedPlaceholder = NSAttributedString(string: "I'm looking for...")
        searchTextField.clearsOnBeginEditing = true
        searchTextField.returnKeyType = .go
        searchTextField.textAlignment = .left
        view.addSubview(searchTextField)
    }
    
    func setupConstraints() {
        searchTextField.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(120)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(30)
        }
    }
}

//MARK: - delegate methods

extension SearchViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("The user is looking for \(searchTextField.text!)")
        textField.endEditing(true)
        return true
    }
    
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        if textField.text != ""  {
//            return true
//        } else {
//            textField.placeholder = "Please enter an item you're looking for"
//            return true
//        }
//    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //use searchtextfield.text and then reset
        
        textField.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
