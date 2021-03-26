//
//  SearchViewController.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/16/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    let searchBar = UISearchBar()
    var collectionView: UICollectionView?
    let homeVC = HomeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        setupUI()
        setupConstraints()
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
}

// MARK: - search bar delegate methods

extension SearchViewController: UISearchBarDelegate {

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("The user is looking for \(searchBar.text ?? "nothing")")
        searchBar.text = ""
        searchBar.endEditing(true)
        print("end editing")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("text has been changed to \(searchBar.text ?? "empty")")
    }
}

// MARK: - collection view delegate, data source methods

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        cell.backgroundColor = .blue
//        cell.priceLabel.text = "$\(homeVC.categories[indexPath.row].price)"
//        if let url = URL(string: (homeVC.categories[indexPath.row].colors[0].itemPic)) {
//                if let picture = try? Data(contentsOf: url) {
//                    cell.furniturePic.image = UIImage(data: picture)
//                }
//            }

        return cell
    }
}
