//
//  ItemViewController.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/23/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {
    
    var backgroundImage = UIImageView()
    let itemPic = UIImageView()
    let info = MainInfo()
    let cartButton = UIButton()
    var colors = ColorButtons()
    var rgbColors = [UIColor]()
    var picturesArray = [String]()
    var buttonColorPictureTuple = [(UIColor, String)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        makeTuple()
        createButton()
    }
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
    
    func makeTuple() {
        buttonColorPictureTuple = zip(rgbColors, picturesArray).map { ($0, $1) }
    }
    
    func createButton() {
        for pair in buttonColorPictureTuple {
            let newButton = UIButton()
            newButton.backgroundColor = pair.0
            newButton.layer.cornerRadius = 15
            newButton.layer.borderWidth = 1
            newButton.layer.borderColor = UIColor.black.cgColor
            newButton.clipsToBounds = true
            newButton.snp.makeConstraints { (make) in
                make.height.width.equalTo(30)
            }
            newButton.isSelected = false
            colors.buttonsArray.append(newButton)
            colors.stack.addArrangedSubview(newButton)
            newButton.addTarget(self, action: #selector(colorPressed), for: .touchUpInside)
        }
    }
    
    @objc func colorPressed(sender: UIButton!) {
        for b in colors.buttonsArray {
            if b == sender {
                b.isSelected = true
                b.changeButtonAppearance()
                for pair in buttonColorPictureTuple {
                    if b.backgroundColor! == pair.0 {
                        let pic = pair.1
                        if let url = URL(string: pic) {
                            if let picture = try? Data(contentsOf: url) {
                                itemPic.image = UIImage(data: picture)
                            }
                        }
                    }
                }
            } else {
                b.isSelected = false
                b.changeButtonAppearance()
            }
        }
    }
    
    func setupUI() {
        for color in colors.colorsArray {
            let colorUI = color.hexStringToUIColor(hex: color)
            rgbColors.append(colorUI)
        }
        
        itemPic.contentMode = .scaleAspectFit
        if rgbColors.isEmpty {
            colors.colorLabel.text = ""
        }
        backgroundImage.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Back",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(back))
        navigationItem.leftBarButtonItem?.tintColor = .black
        cartButton.setImage(UIImage(systemName: "cart"), for: .normal)
        cartButton.tintColor = .black
        cartButton.layer.cornerRadius = 4.0
        cartButton.layer.borderWidth = 1
        cartButton.layer.borderColor = UIColor.black.cgColor
        cartButton.addTarget(self, action: #selector(addToCart), for: .touchUpInside)
        
        view.addSubview(backgroundImage)
        view.addSubview(itemPic)
        view.addSubview(info)
        view.addSubview(cartButton)
        view.addSubview(colors)
    }
    
    @objc func addToCart(sender: UIButton!) {
        sender.setBackgroundColor(color: .gray, forState: .highlighted)
        print("Add the item to a cart")
    }

    func setupConstraints() {
        backgroundImage.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        itemPic.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Elements.medium.size)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(Elements.big.size)
        }
        info.snp.makeConstraints { (make) in
            make.top.equalTo(itemPic.snp.bottom).offset(Spaces.tiny.size)
            make.leading.equalToSuperview().offset(Spaces.medium.size)
            make.trailing.equalToSuperview().offset(-Spaces.medium.size)
            make.height.equalTo(Elements.big.size)
        }
        colors.snp.makeConstraints { (make) in
            make.top.equalTo(info.snp.bottom).offset(Spaces.medium.size)
            make.leading.equalToSuperview().offset(Spaces.medium.size)
            make.trailing.equalToSuperview().offset(-Spaces.medium.size)
            make.height.equalTo(40)
        }
        cartButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-Spaces.big.size)
            make.height.equalTo(40)
            make.width.equalTo(50)
            make.centerX.equalToSuperview()
        }
    }
}

extension ItemViewController: ReturnDataDelegate {
    func returnData(data: FurnitureData) {
        let url = URL(string: data.categories[0].colors[0].itemPic)
        let dataM = try? Data(contentsOf: url!)
        DispatchQueue.main.async {
            self.itemPic.image = UIImage(data: dataM!)
            self.info.itemName.text = data.categories[0].name
            self.info.itemPrice.text = "$\(data.categories[0].price)"
            self.info.itemDescription.text = data.categories[0].description
        }
    }
}
