//
//  ViewController.swift
//  FurnitureShop
//
//  Created by Maria Budkevich on 2/11/21.
//  Copyright © 2021 Mary Tim. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
 
    let greeting = GreetingUserView()
    let scrollableView = ScrollableHStack()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUPUI()
        setUpConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    func setUPUI() {
        view.addSubview(greeting)
        view.addSubview(scrollableView)
    }
    
    func setUpConstraints() {
        greeting.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(90)
            make.leading.equalToSuperview().offset(30)
            make.height.equalTo(70)
            make.width.equalToSuperview()
        }
        scrollableView.snp.makeConstraints { (make) in
            make.top.equalTo(greeting.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(30)
            //make.width.equalToSuperview()
            make.height.equalTo(80)
        }
        
    }
}



