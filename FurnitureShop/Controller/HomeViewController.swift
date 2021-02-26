//
//  ViewController.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/11/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    let greeting = GreetingUserView()
    let scrollableView = ScrollableHStack()
    var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
}

//MARK: - delegate, dataSource methods

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reusableCell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.cellIdentifier, for: indexPath)
        return reusableCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
          let rootVC = ItemViewController()
          let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true)
    }
}

