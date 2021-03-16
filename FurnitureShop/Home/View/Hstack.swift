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

    var arrayButtons = [UIButton]()
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

    func setupUI() {
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
