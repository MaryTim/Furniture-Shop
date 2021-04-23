//
//  CartViewController.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/16/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import UIKit
import RealmSwift

class CartViewController: UIViewController {

    let itemVC = ItemViewController()
    let realm = try! Realm()
    let cartLabel = UILabel()
    let tableV = UITableView()
    let checkoutButton = UIButton()
    let totalLabel = UILabel()
    var itemsInCart: Results<ItemModel>?
    var totalSum: Int = 0 {
        didSet {
            totalLabel.text = "Total: $\(totalSum)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
        tableV.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.cellID)
        tableV.dataSource = self
        tableV.delegate = self
        setupUI()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadItems()
        tableV.reloadData()
    }
    
    func loadItems() {
        itemsInCart = realm.objects(ItemModel.self)
        tableV.reloadData()
        calculateTotalSum()
    }
    
    func calculateTotalSum() {
     totalSum = 0
        let arrayResults: [ItemModel] = (itemsInCart?.toArray())!
        for item in arrayResults {
            let priceString = item.price.dropFirst()
            guard let priceInt = Int(priceString) else {
                assertionFailure("Price of an item can't be nil or 0")
                return
            }
            totalSum += priceInt
        }
    }
    
    func setupUI() {
        cartLabel.text = "Cart"
        cartLabel.font = UIFont(name: "PlayfairDisplay-Bold", size: 30)
        cartLabel.textAlignment = .center
        tableV.separatorStyle = .none
        tableV.allowsSelection = false
        checkoutButton.tag = 0
        checkoutButton.setTitle("CHECKOUT", for: .normal)
        checkoutButton.setTitleColor(.black, for: .normal)
        checkoutButton.backgroundColor = MyColor.silverRust09.value
        checkoutButton.layer.cornerRadius = 4.0
        checkoutButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        totalLabel.text = "Total: $0"
        totalLabel.backgroundColor = .clear
        totalLabel.textColor = MyColor.fedora1.value
        view.addSubview(cartLabel)
        view.addSubview(tableV)
        view.addSubview(checkoutButton)
        view.addSubview(totalLabel)
    }
    
    func setupConstraints() {
        cartLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Spaces.big.size)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(Elements.label.size.height)
        }
        tableV.snp.makeConstraints { (make) in
            make.top.equalTo(cartLabel.snp.bottom).offset(Spaces.small.size)
            make.leading.equalToSuperview().offset(Spaces.medium.size)
            make.trailing.equalToSuperview().offset(-Spaces.medium.size)
            make.bottom.equalToSuperview().offset(-Spaces.huge.size)
        }
        totalLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(Spaces.medium.size)
            make.top.equalTo(tableV.snp.bottom).offset(Spaces.small.size + 5)
            make.height.equalTo(Elements.sumInACell.size.height)
            make.width.equalTo(100)
        }
        checkoutButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(totalLabel.snp.centerY)
            make.leading.equalTo(totalLabel.snp.trailing).offset(40)
            make.width.equalTo(Elements.saveButton.size.width)
            make.height.equalTo(Elements.saveButton.size.height)
        }
    }
// MARK: - buttom action
    
    @objc func buttonAction(sender: UIButton!, cell: CustomTableViewCell) {
        
        if sender.currentTitle! == "-" {
            let quantityInt = Int(cell.quantityLabel.text ?? "1")
            if var quantityIntNotOptional = quantityInt {
                quantityIntNotOptional -= 1
                DispatchQueue.main.async {
                    cell.quantityLabel.text = "\(quantityIntNotOptional)"
                    print(cell.quantityLabel.text)
                }
            }
        }
        if sender.titleLabel?.text == "+" {
            let quantityInt = Int(cell.quantityLabel.text ?? "1")
            if var quantityIntNotOptional = quantityInt {
                quantityIntNotOptional += 1
                DispatchQueue.main.async {
                    cell.quantityLabel.text = "\(quantityIntNotOptional)"
                    print(cell.quantityLabel.text)
                }
            }
        }
        tableV.reloadData()
        print("Button \(sender.titleLabel?.text ?? "unknown") tapped")
    }
}

// MARK: - delegate, data source methods

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsInCart?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.cellID, for: indexPath) as! CustomTableViewCell
        cell.descriptionLabel.text = itemsInCart?[indexPath.row].name
        cell.sumLabel.text = itemsInCart?[indexPath.row].price ?? ""
        cell.itemPic.image = itemsInCart?[indexPath.row].pic.toImage()
        cell.minusButton.addTarget(self, action: #selector(buttonAction(sender:cell:)), for: .touchUpInside)
        cell.plusButton.addTarget(self, action: #selector(buttonAction(sender:cell:)), for: .touchUpInside)
        cell.minusButton.tag = indexPath.row
        cell.plusButton.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Elements.cell.size.height
    }
}
