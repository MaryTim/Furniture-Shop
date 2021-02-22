//
//  SignOutViewController.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/19/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import Foundation
import UIKit

class SignOutViewController: UIViewController {
    
    let questionLabel = UILabel()
    let yesButton = UIButton()
    let cancelButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Sign Out"
        setupUI()
        setupConstraints()
    }
    
    func setupUI() {
        questionLabel.text = "Are you sure you want to sign out?"
        questionLabel.font = questionLabel.font.withSize(23)
        questionLabel.textAlignment = .center
        yesButton.setTitle("Sign Out", for: .normal)
        yesButton.titleLabel?.font = yesButton.titleLabel?.font.withSize(22)
        yesButton.setTitleColor(.black, for: .normal)
        yesButton.layer.cornerRadius = 10.0
        yesButton.layer.borderWidth = 2
        yesButton.layer.borderColor = UIColor(red: 111/255, green: 108/255, blue: 110/255, alpha: 1).cgColor
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.black, for: .normal)
        cancelButton.layer.cornerRadius = 10.0
        cancelButton.layer.borderWidth = 2
        cancelButton.layer.borderColor = UIColor(red: 111/255, green: 108/255, blue: 110/255, alpha: 1).cgColor
        cancelButton.titleLabel?.font = cancelButton.titleLabel?.font.withSize(22)
        yesButton.addTarget(self, action: #selector (yesPressed), for: .touchUpInside)
        yesButton.setBackgroundColor(color: UIColor(red: 111/255, green: 108/255, blue: 110/255, alpha: 0.2), forState: .highlighted)
        cancelButton.setBackgroundColor(color: UIColor(red: 111/255, green: 108/255, blue: 110/255, alpha: 0.2), forState: .highlighted)
        cancelButton.addTarget(self, action: #selector(cancelPressed), for: .touchUpInside)
        view.addSubview(questionLabel)
        view.addSubview(yesButton)
        view.addSubview(cancelButton)
    }
    
    
    @objc func yesPressed(sender: UIButton!) {

        //dismiss(animated: true) {}
        print("User wants to sign out! Do smth with it")
    }
    
    @objc func holdDown(sender: UIButton!) {
        sender.layer.shadowOpacity = 0.0
        sender.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    @objc func cancelPressed(sender: UIButton!) {
        dismiss(animated: true) {
        }
        print("User wants to stay signed in")
    }
    
    func setupConstraints() {
        questionLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(200)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(70)
        }
        yesButton.snp.makeConstraints { (make) in
            make.top.equalTo(questionLabel.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(80)
            make.height.equalTo(50)
            make.width.equalTo(120)
        }
        cancelButton.snp.makeConstraints { (make) in
            make.top.equalTo(questionLabel.snp.bottom).offset(50)
            make.leading.equalTo(yesButton.snp.trailing).offset(20)
            make.height.equalTo(50)
            make.width.equalTo(120)
        }
    }
}

extension UIButton {
    func setBackgroundColor(color: UIColor, forState: UIControl.State) {
        self.clipsToBounds = true 
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
            let colorImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            self.setBackgroundImage(colorImage, for: forState)
        }
    }
}
