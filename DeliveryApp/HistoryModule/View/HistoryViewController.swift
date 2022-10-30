//
//  HistoryViewController.swift
//  DeliveryApp
//
//  Created by Aidar Asanakunov on 28/10/22.
//

import UIKit
import RxCocoa
import RxSwift
import RxRelay

class HistoryViewController: UIViewController {
    
    let viewModel = HistoryViewModel()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.layer.borderColor = UIColor.gray.cgColor
        tableView.rowHeight = 83
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.didGetList()
        tableView.reloadData()
    }
    
    func setupViews() {
        view.addSubview(tableView)
    }
    func setupConstraints() {
        
        tableView.snp.makeConstraints { make in
            make.top.trailing.leading.bottom.equalToSuperview()
        }
    }
}
extension HistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.list.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MainTableViewCell else {
            return UITableViewCell()
        }
        cell.firstTitleLabel.text = "\(viewModel.list.value[indexPath.row].name ?? "gg")"
        cell.secondTitleLabel.text = "\(viewModel.list.value[indexPath.row].fromWhere ?? "afas") - \(viewModel.list.value[indexPath.row].toWhere ?? "asdaf")"
        return cell
    }
}
extension HistoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let descriptionVC = DescriptionViewController()
        descriptionVC.modalPresentationStyle = .fullScreen
        present(descriptionVC, animated: true)
    }
}
