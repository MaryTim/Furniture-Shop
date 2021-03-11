//
//  ViewController.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/11/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController, ReturnDataDelegate {
    
    var set = Set<String>()
    var array = [String]()
    
    let greeting = GreetingUserView()
    let scrollableView = ScrollableHStack()
    var collectionView: UICollectionView?
    let manager = FurnitureManager()
    var furnitureData: FurnitureData?
    var categoriesArray = [Categories]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.performRequest()
        showSpinner()
        setUPUI()
        setUpConstraints()
    }

    func setUPUI() {
        
        view.addSubview(greeting)
        view.addSubview(scrollableView)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: 160, height: 160)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionV = collectionView else {
            return
        }
        collectionV.backgroundColor = .clear
        collectionV.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.cellIdentifier)
        collectionV.dataSource = self
        collectionV.delegate = self
        view.addSubview(collectionV)
    }
    
    func setUpConstraints() {
        
        greeting.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(90)
            make.leading.equalToSuperview().offset(30)
            make.height.equalTo(70)
            make.width.equalToSuperview()
        }
        scrollableView.snp.makeConstraints { (make) in
            make.top.equalTo(greeting.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(40)
        }
        collectionView!.snp.makeConstraints { (make) in
            make.top.equalTo(scrollableView.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-30)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    func returnData(data: FurnitureData) {
        DispatchQueue.main.async {
            self.furnitureData = data
            self.categoriesArray = data.categories
            self.collectionView?.reloadData()
            self.makeButtons()
            self.hideSpinner()
        }
    }
    
    func makeButtons() {
        for category in furnitureData!.categories {
            set.insert(category.type)
        }
        for category in set {
            let uppercased = category.uppercased()
            array.append(uppercased)
        }
        array.sort()
        print(array)
        for category in array {
            let newButton = UIButton()
            newButton.setTitle(category, for: .normal)
            newButton.setTitleColor(UIColor(red: 111/255, green: 108/255, blue: 110/255, alpha: 1), for: .normal)
            newButton.backgroundColor = .clear
            newButton.titleLabel?.textAlignment = .center
            newButton.titleLabel?.adjustsFontSizeToFitWidth = true
            
            newButton.setTitleColor(.black, for: .selected)
            newButton.isSelected = false
            scrollableView.arrayButtons.append(newButton)
            scrollableView.horizontalStack.addArrangedSubview(newButton)
            newButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        }
    }
    
    @objc func buttonPressed(sender: UIButton!) {
        
        for b in scrollableView.arrayButtons {
            if b == sender {
                b.isSelected = true
                categoriesArray = furnitureData!.categories
                categoriesArray = categoriesArray.filter {$0.type == sender.currentTitle?.lowercased()}
                collectionView?.reloadData()
            } else {
                
                b.isSelected = false
            }
        }
       // print("Button \(sender.currentTitle!) is pressed")
    }
}
// MARK: - delegate, dataSource methods

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoriesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        
        if furnitureData != nil {
            cell.priceLabel.text = "$" + String(categoriesArray[indexPath.row].price)
            let url = URL(string: (categoriesArray[indexPath.row].colors[0].itemPic))
            let picture = try? Data(contentsOf: url!)
            cell.furniturePic.image = UIImage(data: picture!)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let rootVC = ItemViewController()
        rootVC.info.itemName.text = categoriesArray[indexPath.row].name
        rootVC.info.itemDescription.text = categoriesArray[indexPath.row].description
        rootVC.info.itemPrice.text = "$" + String(categoriesArray[indexPath.row].price)
        DispatchQueue.main.async {
            if let buttonColor = self.categoriesArray[indexPath.row].colors[0].buttonColor {
                for color in self.categoriesArray[indexPath.row].colors {
                    rootVC.colors.colorsArray.append(color.buttonColor!)
                }
                for picture in self.categoriesArray[indexPath.row].colors {
                    rootVC.picturesArray.append(picture.itemPic)
                }
//                print(rootVC.colors.colorsArray)
//                print(rootVC.picturesArray)
            }
        }
        let url = URL(string: (categoriesArray[indexPath.row].colors[0].itemPic))
        let picture = try? Data(contentsOf: url!)
        rootVC.itemPic.image = UIImage(data: picture!)
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true)
    }
}
