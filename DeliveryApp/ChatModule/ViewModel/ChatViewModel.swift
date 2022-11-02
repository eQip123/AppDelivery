//
//  ChatViewModel.swift
//  DeliveryApp
//
//  Created by Александр Калашников on 2/11/22.
//

import Foundation
import RxCocoa
import RxRelay
import RxSwift
import FirebaseStorage
import FirebaseAuth
import FirebaseDatabase
import Firebase

class ChatViewModel {
    private let model = ChatModel()
    private let disposeBag = DisposeBag()
    let text = BehaviorRelay<String>(value: "")
    var massages = BehaviorRelay<[DataSnapshot]>(value: [])
    
    init() {
        bindModel()
    }
    
    func sendMassage() {
        model.sendMassage()
    }
    
    func configureDatabase(tableView: UITableView) {
        model.configureDatabase(tableview: tableView)
    }
    
    func bindModel() {
        text
            .bind(to: model.massageText)
            .disposed(by: disposeBag)
        
        model.massages
            .bind(to: massages)
            .disposed(by: disposeBag)
    }
}
