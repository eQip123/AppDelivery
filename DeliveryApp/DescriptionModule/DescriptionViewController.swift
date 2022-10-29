//
//  DescriptionViewController.swift
//  DeliveryApp
//
//  Created by Aidar Asanakunov on 28/10/22.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
class DescriptionViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    private lazy var backButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "back"), for: .normal)
        return view
    }()
    private lazy var mainTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Order"
        label.textColor = .black
        label.font = .systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Наименование"
        label.textColor = #colorLiteral(red: 0.8505133986, green: 0.8505132794, blue: 0.8505132794, alpha: 1)
        return label
    }()
    
    private lazy var fromWhereLabel: UILabel = {
        let label = UILabel()
        label.text = "Откуда"
        label.textColor = #colorLiteral(red: 0.8505133986, green: 0.8505132794, blue: 0.8505132794, alpha: 1)
        return label
    }()
    
    private lazy var whereLabel: UILabel = {
        let label = UILabel()
        label.text = "Куда"
        label.textColor = #colorLiteral(red: 0.8505133986, green: 0.8505132794, blue: 0.8505132794, alpha: 1)
        return label
    }()
    
    private lazy var widthLabel: UILabel = {
        let label = UILabel()
        label.text = "Ширина"
        label.textColor = #colorLiteral(red: 0.8505133986, green: 0.8505132794, blue: 0.8505132794, alpha: 1)
        return label
    }()
    
    private lazy var heightLabel: UILabel = {
        let label = UILabel()
        label.text = "Высота"
        label.textColor = #colorLiteral(red: 0.8505133986, green: 0.8505132794, blue: 0.8505132794, alpha: 1)
        return label
    }()
    
    private lazy var weightLabel: UILabel = {
        let label = UILabel()
        label.text = "Вес, кг"
        label.textColor = #colorLiteral(red: 0.8505133986, green: 0.8505132794, blue: 0.8505132794, alpha: 1)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Комментарий..."
        label.textColor = #colorLiteral(red: 0.8505133986, green: 0.8505132794, blue: 0.8505132794, alpha: 1)
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        backButtonPressed()
    }
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(backButton)
        view.addSubview(mainTitleLabel)
        view.addSubview(titleLabel)
        view.addSubview(fromWhereLabel)
        view.addSubview(whereLabel)
        view.addSubview(widthLabel)
        view.addSubview(heightLabel)
        view.addSubview(weightLabel)
        view.addSubview(descriptionLabel)
    }
    private func setupConstraints() {
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.leading.equalTo(view.snp.leading).offset(15)
            
            mainTitleLabel.snp.makeConstraints { make in
                make.top.equalTo(backButton.snp.bottom).offset(30)
                make.centerX.equalToSuperview()
            }
            
            titleLabel.snp.makeConstraints { make in
                make.top.equalTo(mainTitleLabel.snp.bottom).offset(20)
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().offset(-20)
            }
            fromWhereLabel.snp.makeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).offset(50)
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().offset(-20)
            }
            whereLabel.snp.makeConstraints { make in
                make.top.equalTo(fromWhereLabel.snp.bottom).offset(50)
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().offset(-20)
            }
            widthLabel.snp.makeConstraints { make in
                make.top.equalTo(whereLabel.snp.bottom).offset(50)
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().offset(-20)
            }
            heightLabel.snp.makeConstraints { make in
                make.top.equalTo(widthLabel.snp.bottom).offset(50)
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().offset(-20)
            }
            weightLabel.snp.makeConstraints { make in
                make.top.equalTo(heightLabel.snp.bottom).offset(50)
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().offset(-20)
            }
            descriptionLabel.snp.makeConstraints { make in
                make.top.equalTo(weightLabel.snp.bottom).offset(50)
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().offset(-20)
            }

        }
    }
    private func backButtonPressed() {
        backButton
            .rx
            .tap
            .bind {
                
            }.disposed(by: disposeBag)
    }
    
}
