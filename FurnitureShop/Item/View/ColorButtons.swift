//
//  ColorButtons.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/23/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import UIKit

class ColorButtons: UIView {
    
    let colorLabel = UILabel()
    var colorsArray =  [
        Color(name: UIImage(named: "atomic red")!),
        Color(name: UIImage(named: "emerald")!),
        Color(name: UIImage(named: "grey")!),
        Color(name: UIImage(named: "ivory")!),
        Color(name: UIImage(named: "sunny")!),
        Color(name: UIImage(named: "teal")!)
    ]
    var stack = UIStackView()
    var buttonsArray = [UIButton]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createButton() {
        for color in colorsArray {
            let newButton = UIButton()
            newButton.setBackgroundImage(color.name, for: .normal)
            newButton.layer.cornerRadius = 15
            newButton.layer.borderWidth = 1
            newButton.layer.borderColor = UIColor.black.cgColor
            newButton.clipsToBounds = true
            newButton.snp.makeConstraints { (make) in
                make.height.width.equalTo(30)
            }
            newButton.isSelected = false
            buttonsArray.append(newButton)
            stack.addArrangedSubview(newButton)
            newButton.addTarget(self, action: #selector(colorPressed), for: .touchUpInside)
        }
    }
    
    @objc func colorPressed(sender: UIButton!) {
        for b in buttonsArray {
            if b == sender {
                b.isSelected = true
                b.changeButtonAppearance()
            } else {
                b.isSelected = false
                b.changeButtonAppearance()
            }
        }
        print("Button \(sender.backgroundImage(for: .normal)!) is pressed")
    }
    
    func setupUI() {
        colorLabel.text = "Colors"
        colorLabel.textAlignment = .center
        createButton()
        stack.alignment = .fill
        stack.spacing = 10
        stack.distribution = .fill
        
        addSubview(stack)
        addSubview(colorLabel)
    }
    
    func setupConstraints() {
        colorLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(50)
        }
        stack.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(colorLabel.snp.trailing).offset(10)
            make.height.equalTo(30)
            make.trailing.lessThanOrEqualToSuperview()
        }
    }
}
