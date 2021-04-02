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
            totalSum += Int(priceString) ?? 0
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
        checkoutButton.backgroundColor = UIColor(red: 204/255, green: 197/255, blue: 188/255, alpha: 0.9)
        checkoutButton.layer.cornerRadius = 4.0
        checkoutButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        totalLabel.text = "Total: $0"
        totalLabel.backgroundColor = .clear
        totalLabel.textColor = UIColor(red: 111/255, green: 108/255, blue: 110/255, alpha: 1)
        view.addSubview(cartLabel)
        view.addSubview(tableV)
        view.addSubview(checkoutButton)
        view.addSubview(totalLabel)
    }
    
    func setupConstraints() {
        cartLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(50)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(70)
        }
        tableV.snp.makeConstraints { (make) in
            make.top.equalTo(cartLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-140)
        }
        totalLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(80)
            make.top.equalTo(tableV.snp.bottom).offset(15)
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
        checkoutButton.snp.makeConstraints { (make) in
            make.leading.equalTo(totalLabel.snp.trailing).offset(40)
            make.bottom.equalToSuperview().offset(-93)
            make.width.equalTo(120)
            make.height.equalTo(40)
        }
    }
// MARK: - buttom action
// Add actions to =/- buttons (update quantityLabel)
    
    @objc func buttonAction(sender: UIButton!, cell: CustomTableViewCell) {
        //print(sender.tag)
        if sender.currentTitle! == "-" {
            let quantityInt = Int(cell.quantityLabel.text ?? "1")
            if var quantityIntNotOptional = quantityInt {
                quantityIntNotOptional -= 1
                cell.quantityLabel.text = "\(quantityIntNotOptional)"
                print(cell.quantityLabel.text)
            }
        }
        if sender.titleLabel?.text == "+" {
         let quantityInt = Int(cell.quantityLabel.text ?? "1")
                  if var quantityIntNotOptional = quantityInt {
                      quantityIntNotOptional += 1
                      cell.quantityLabel.text = "\(quantityIntNotOptional)"
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
        return 110
    }
}
