//
//  MainViewController.swift
//  DeliveryApp
//
//  Created by Aidar Asanakunov on 28/10/22.
//
import Foundation
import UIKit
import SnapKit
import RxSwift
import RxCocoa
import RxRelay
class MainViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    let viewModel = MainViewModel()
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.didGetOrderList()
        tableView.reloadData()
    }
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(givingShine)
        view.addSubview(tableView)
    }
    private func setupConstraints() {
        givingShine.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.left.equalToSuperview().offset(22)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(givingShine.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(22)
            make.trailing.equalToSuperview().offset(-22)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-50)
        }
    }
}
extension MainViewController: UITableViewDataSource {
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
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.getOrder(name: viewModel.list.value[indexPath.row].name!, fromWhere: viewModel.list.value[indexPath.row].fromWhere!, toWhere: viewModel.list.value[indexPath.row].toWhere!, width: viewModel.list.value[indexPath.row].width!, height: viewModel.list.value[indexPath.row].height!, weight: viewModel.list.value[indexPath.row].weight!, comment: viewModel.list.value[indexPath.row].comment!)
        
        viewModel.didGetOrder(order: viewModel.list.value[indexPath.row])
        let descriptionVC = DescriptionViewController()
        self.navigationItem.title = ""
        navigationController?.pushViewController(descriptionVC, animated: true)
    }
}
