//
//  NewOrderViewModel.swift
//  AppStore
//
//  Created by Aidar Asanakunov on 20/10/22.
//

import Foundation
import RxRelay
import RxSwift
import RxCocoa
import UIKit

class NewOrderViewModel {
    private let disposeBag = DisposeBag()
    private let model = NewOrderModel()
    
    let name = BehaviorRelay<String>(value: "")
    let fromWhere = BehaviorRelay<String>(value: "")
    let toWhere = BehaviorRelay<String>(value: "")
    let width = BehaviorRelay<String>(value: "")
    let height = BehaviorRelay<String>(value: "")
    let weight = BehaviorRelay<String>(value: "")
    let comment = BehaviorRelay<String>(value: "")
    
    func alertPres() -> UIAlertController {
        let alert = UIAlertController(title: "Успешно добавили", message: "Заказ добавлен добавлен в список", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        return alert
    }
    
    func saveOrder() {
        model.add(name: name.value, fromWhere: fromWhere.value, toWhere: toWhere.value, width: width.value, height: height.value, weight: weight.value, comment: comment.value)
    }
}
