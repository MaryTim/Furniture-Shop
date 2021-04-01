//
//  CustomTableViewCell.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/17/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import UIKit
import SnapKit

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
        label.text = "Rivet Canton Deep Mid-Century Modern Loveseat Sofa Couch, 76.7W"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor(red: 111/255, green: 108/255, blue: 110/255, alpha: 1)
        label.backgroundColor = .clear
        label.textAlignment = .center
        return label
    }()
    
    let minusButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 4.0
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 111/255, green: 108/255, blue: 110/255, alpha: 1).cgColor
        return button
    }()
    
    let plusButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.layer.cornerRadius = 4.0
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 4.0
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 111/255, green: 108/255, blue: 110/255, alpha: 1).cgColor
        return button
    }()
    
    let quantityLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = "1"
        label.textAlignment = .center
        return label
    }()
    
    let sumLabel: UILabel = {
        let label = UILabel()
        label.text = "$0"
        label.textColor = .black
        label.textAlignment = .center
        label.font = label.font.withSize(20)
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
        addSubview(itemPic)
        addSubview(descriptionLabel)
        addSubview(minusButton)
        addSubview(quantityLabel)
        addSubview(plusButton)
        addSubview(sumLabel)
    }
    
    func setupConstraints() {
        itemPic.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview()
            make.height.width.equalTo(100)
        }
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(itemPic.snp.trailing).offset(8)
            make.height.equalTo(70)
            make.width.equalTo(170)
        }
        sumLabel.snp.makeConstraints { (make) in
            make.top.equalTo(descriptionLabel.snp.bottom)
            make.leading.equalTo(itemPic.snp.trailing).offset(8)
            make.width.equalTo(150)
            make.height.equalTo(35)
        }
        minusButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalTo(descriptionLabel.snp.trailing).offset(8)
            make.height.equalTo(35)
            make.width.equalTo(25)
        }
        quantityLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalTo(minusButton.snp.trailing).offset(1)
            make.height.equalTo(35)
            make.width.equalTo(30)
        }
        plusButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalTo(quantityLabel.snp.trailing).offset(1)
            make.height.equalTo(35)
            make.width.equalTo(minusButton.snp.width)
        }
    }
}
