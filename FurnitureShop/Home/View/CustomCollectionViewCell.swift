//
//  CustomCollectionViewCell.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/16/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import UIKit
import SnapKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "CustomCollectionViewCell"

    let furniturePic: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "sofa")
        image.layer.cornerRadius = 10.0
        image.backgroundColor = .clear
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$1000"
        label.font = UIFont(name: "Al Nile", size: 20)
        label.textColor = MyColor.priceHomeVC.value
        label.backgroundColor = .clear
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(furniturePic)
        addSubview(priceLabel)
    }
    
    func setupConstraints() {
        furniturePic.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-20)
        }
        priceLabel.snp.makeConstraints { (make) in
            make.bottom.leading.trailing.equalToSuperview()
            make.top.equalTo(furniturePic.snp.bottom).offset(1)
        }
    }
}
