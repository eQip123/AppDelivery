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
extension MainViewController: UITableViewDataSource {
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
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let descriptionVC = DescriptionViewController()
        descriptionVC.modalPresentationStyle = .fullScreen
        present(descriptionVC, animated: true)
    }
}
