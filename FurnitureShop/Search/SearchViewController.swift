//
//  SearchViewController.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/16/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, ReturnDataDelegate {

    let manager = FurnitureManager()
    let searchBar = UISearchBar()
    var collectionView: UICollectionView?
    var furnitureData: FurnitureData?
    var categories = [Categories]()
    var categoriesForSearch = [Categories]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.performRequest()
        searchBar.delegate = self
        setupUI()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView?.isHidden = true
    }
    
    func setupUI() {
        searchBar.showsCancelButton = true
        searchBar.searchBarStyle = UISearchBar.Style.minimal
        searchBar.barStyle = .default
        searchBar.sizeToFit()
        searchBar.returnKeyType = .go
        searchBar.placeholder = "I'm looking for..."
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
        view.addSubview(searchBar)
    }
    
    func setupConstraints() {
        searchBar.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(120)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(30)
        }
        collectionView!.snp.makeConstraints { (make) in
            make.top.equalTo(searchBar.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(30)
            make.bottom.equalToSuperview().offset(-30)
            make.trailing.equalToSuperview().offset(-20)
        }
    }

func returnData(data: FurnitureData) {
    DispatchQueue.main.async {
        self.furnitureData = data
        self.categories = data.categories
        self.categoriesForSearch = data.categories
        self.collectionView?.reloadData()
    }
}
}
// MARK: - search bar delegate methods

extension SearchViewController: UISearchBarDelegate {

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        collectionView?.isHidden = false
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        categories.removeAll()
        for item in categoriesForSearch {
            if item.name.lowercased().contains(searchBar.text!.lowercased()) {
                categories.append(item)
            }
        }
        collectionView?.reloadData()
        searchBar.text = ""
        searchBar.endEditing(true)
    }
}

// MARK: - collection view delegate, data source methods

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        cell.priceLabel.font = UIFont(name: "Al Nile", size: 13)
        cell.priceLabel.numberOfLines = 0
        cell.priceLabel.text = "\(categories[indexPath.row].name)"
        if let url = URL(string: (categories[indexPath.row].colors[0].itemPic)) {
                if let picture = try? Data(contentsOf: url) {
                   cell.furniturePic.image = UIImage(data: picture)
                }
            }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let rootVC = ItemViewController()
        rootVC.info.itemName.text = categories[indexPath.row].name
        rootVC.info.itemDescription.text = categories[indexPath.row].description
        rootVC.info.itemPrice.text = "$\(categories[indexPath.row].price)"
        DispatchQueue.main.async {
            if let buttonColor = self.categories[indexPath.row].colors[0].buttonColor {
                for color in self.categories[indexPath.row].colors {
                    rootVC.colors.colorsArray.append(color.buttonColor!)
                }
                for picture in self.categories[indexPath.row].colors {
                    //rootVC.picturesArray.append(picture.itemPic)
                }
            }
        }
        let url = URL(string: (categories[indexPath.row].colors[0].itemPic))
        let picture = try? Data(contentsOf: url!)
        rootVC.itemPic.image = UIImage(data: picture!)
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true)
    }
}
