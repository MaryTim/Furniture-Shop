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
    
    let greeting = GreetingUserView()
    let scrollableView = ScrollableHStack()
    var collectionView: UICollectionView?
    let manager = FurnitureManager()
    var furnitureData: FurnitureData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.performRequest()
        setUPUI()
        setUpConstraints()
        showSpinner()
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
            self.collectionView?.reloadData()
            self.hideSpinner()
        }
    }
}
// MARK: - delegate, dataSource methods

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return furnitureData?.categories.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        
        if furnitureData != nil {
            cell.priceLabel.text = "$" + String(furnitureData!.categories[indexPath.row].price)
            let url = URL(string: (furnitureData!.categories[indexPath.row].colors[0].itemPic))
            let picture = try? Data(contentsOf: url!)
            cell.furniturePic.image = UIImage(data: picture!)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        let rootVC = ItemViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true)
    }
}
