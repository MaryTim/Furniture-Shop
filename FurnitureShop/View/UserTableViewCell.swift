//
//  UserTableViewCell.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/18/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    static let cellID = "cellIdentifier"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = .disclosureIndicator
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    var icon: UIImageView = {
        let image = UIImageView()
        image.tintColor = .black
        return image
    }()
    
    var section: UILabel = {
        let section = UILabel()
        section.textAlignment = .left
        section.font = section.font.withSize(20)
        return section
    }()
    
    func setupUI() {
        addSubview(icon)
        addSubview(section)
    }
    
    func setupConstraints() {
        icon.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(40)
            make.leading.equalToSuperview().offset(30)
            make.height.width.equalTo(25)
        }
        section.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalTo(icon.snp.trailing).offset(30)
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
}
