//
//  CustomTableViewCell.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/17/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

 static let cellID = "cell identifier"
    
    let itemPic: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "sofa")
        image.layer.cornerRadius = 10.0
        image.backgroundColor = .clear
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "blablabla"
        label.textColor = UIColor(red: 111/255, green: 108/255, blue: 110/255, alpha: 0.8)
        label.backgroundColor = .clear
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        setupUI()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        itemPic.backgroundColor = .black
        descriptionLabel.backgroundColor = .blue
        addSubview(itemPic)
        addSubview(descriptionLabel)
    }
    
    func setupConstraints() {
        itemPic.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview()
            make.height.width.equalTo(150)
        }
        descriptionLabel.snp.makeConstraints { (make) in
            make.trailing.top.equalToSuperview()
            make.height.equalTo(150)
            make.width.equalTo(200)
        }
    }
}
