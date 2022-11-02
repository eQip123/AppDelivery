import RxSwift
import UIKit
import RxRelay
import RxCocoa
import Foundation

class SignInViewModel {
    private let model = SignInModel()
    private let disposeBag = DisposeBag()
    
    let email = BehaviorRelay<String>(value: "")
    let pass = BehaviorRelay<String>(value: "")
    let status = BehaviorRelay<Bool>(value: false)
    
    func getAlert() -> UIAlertController {
        return model.alertModule()
    }
    
    init() {
        bindStatus()
    }
    
    func bindStatus() {
        model.status
            .bind(to: status)
            .disposed(by: disposeBag)
    }
    
    func canLogIn() {
        model.canLogIn(sEmail: email.value, sPass: pass.value)
//        print(model.status.value)
    }
}
