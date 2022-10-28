//
//  MainViewController.swift
//  DeliveryApp
//
//  Created by Aidar Asanakunov on 28/10/22.
//

import UIKit
class MainViewController: UIViewController {
    
    private lazy var givingShine: UIImageView = {
        let view = UIImageView(image: UIImage(named: "shine"))
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.layer.borderColor = UIColor.gray.cgColor
        view.rowHeight = 83
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(givingShine)
        view.addSubview(tableView)
    }
    func setupConstraints() {
        givingShine.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.left.equalToSuperview().offset(22)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(givingShine.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(22)
            make.trailing.equalToSuperview().offset(-22)
            make.bottom.equalToSuperview().offset(-4)
        }
    }
}
