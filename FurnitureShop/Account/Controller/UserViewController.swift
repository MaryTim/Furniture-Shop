//
//  UserViewController.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/16/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import UIKit
import SnapKit
import Photos

class UserViewController: UIViewController {
    
    let accountVM = AccountViewModel()
    let accountView = AccountTopView()
    let tableView = UITableView()
    let vcArray = [UserDetailsViewController(), AddressViewController(), PaymentViewController(), SignOutViewController()]
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isScrollEnabled = true
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: UserTableViewCell.cellID)
        tableView.delegate = self
        tableView.dataSource = self
        setupUI()
        setupConstraints()
    }
    
    func setupUI() {
        self.accountView.userImage.addTapGesture(tapNumber: 1, target: self, action: #selector(handleTap))
        view.addSubview(accountView)
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        accountView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(Elements.itemPic.size.height)
        }
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(accountView.userImage.snp.bottom).offset(Spaces.big.size)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-(Spaces.medium.size + 30))
        }
    }

    @objc func handleTap(sender: UITapGestureRecognizer) {
        let alert = UIAlertController(title: "Choose a nice picture of you :)", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Go To My Photo Library", style: .default, handler: { _ in
            self.setPicture()
        }))
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
      
    func setPicture() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            present(imagePicker, animated: true, completion: nil)
        } else {
            let alert  = UIAlertController(title: "Warning", message: "You don't have permission to access gallery.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension UserViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.cellID, for: indexPath) as! UserTableViewCell
        cell.icon.image = accountVM.categoriesArray[indexPath.row].categoryIcon
        cell.section.text = accountVM.categoriesArray[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Elements.cell.size.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rootVC = vcArray[indexPath.row]
        let navVC = UINavigationController(rootViewController: rootVC)
        present(navVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension UserViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            accountView.userImage.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}
