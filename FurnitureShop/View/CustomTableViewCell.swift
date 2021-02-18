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
    
    let plusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 169/255, green: 171/255, blue: 172/255, alpha: 1)
        button.titleLabel?.text = "+"
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    let minusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 169/255, green: 171/255, blue: 172/255, alpha: 1)
        button.titleLabel?.text = "-"
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    let quantityLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(red: 211/255, green: 211/255, blue: 212/255, alpha: 1)
        label.text = "0"
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
            make.height.width.equalTo(120)
        }
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(itemPic.snp.trailing).offset(8)
            make.height.equalTo(120)
            make.width.equalTo(150)
        }
        plusButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(descriptionLabel.snp.trailing).offset(8)
            make.height.width.equalTo(10)
            
        }
    }
}
