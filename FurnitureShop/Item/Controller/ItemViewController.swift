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
    var tuples = [(UIColor, String)]()
    
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
        tuples = zip(rgbColors, picturesArray).map { ($0, $1) }
    }
    
    func hexStringToUIColor (hex: String) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        if (cString.count) != 6 {
            return UIColor.gray
        }
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func createButton() {
        for pair in tuples {
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
                for pair in tuples {
                    if b.backgroundColor! == pair.0 {
                        let pic = pair.1
                        let url = URL(string: pic)
                        let picture = try? Data(contentsOf: url!)
                        itemPic.image = UIImage(data: picture!)
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
            rgbColors.append(hexStringToUIColor(hex: color))
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
            make.top.equalToSuperview().offset(80)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(300)
        }
        info.snp.makeConstraints { (make) in
            make.top.equalTo(itemPic.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(300)
        }
        colors.snp.makeConstraints { (make) in
            make.top.equalTo(info.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
        cartButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-50)
            make.height.equalTo(40)
            make.width.equalTo(50)
            make.centerX.equalToSuperview()
        }
    }
}
