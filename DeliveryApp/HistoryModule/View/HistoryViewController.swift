//
//  HistoryViewController.swift
//  DeliveryApp
//
//  Created by Aidar Asanakunov on 28/10/22.
//

import UIKit

class HistoryViewController: UIViewController {
    
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MainTableViewCell else {
            return UITableViewCell()
        }
        cell.firstTitleLabel.text = "Aidar"
        cell.secondTitleLabel.text = "Aidar"
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
