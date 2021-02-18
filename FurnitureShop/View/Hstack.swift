//
//  Hstack.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/15/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class ScrollableHStack: UIView {
    
    var categories = [
        Category(name: "Sofa"),
        Category(name: "Mirror"),
        Category(name: "Table"),
        Category(name: "Chair"),
        Category(name: "Wardrobe"),
        Category(name: "Kitchen Set"),
        Category(name: "Carpet"),
        Category(name: "Bed"),
        Category(name: "Dresser"),
        Category(name: "Lamp"),
    ]
    
    var horizontalStack = UIStackView()
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createButton() {
        for category in categories {
            let newButton = UIButton()
            newButton.setTitle(category.name, for: .normal)
            newButton.setTitleColor(UIColor(red: 111/255, green: 108/255, blue: 110/255, alpha: 1), for: .normal)
            newButton.backgroundColor = .clear
            newButton.titleLabel?.textAlignment = .center
            newButton.titleLabel?.adjustsFontSizeToFitWidth = true
            horizontalStack.addArrangedSubview(newButton)
        }
    }
    
    func setupUI() {
        
        createButton()
        horizontalStack.axis = .horizontal
        horizontalStack.spacing = 15
        horizontalStack.distribution = .fill
        horizontalStack.alignment = .center
        
        scrollView.indicatorStyle = .white
        scrollView.isScrollEnabled = true
        scrollView.isUserInteractionEnabled = true
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(horizontalStack)
        
    }
    
    func setupConstraints() {
        
        scrollView.snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        horizontalStack.snp.makeConstraints { (make) in
            make.top.leading.trailing.bottom.equalToSuperview()
            make.width.greaterThanOrEqualToSuperview()
        }
    }
}
