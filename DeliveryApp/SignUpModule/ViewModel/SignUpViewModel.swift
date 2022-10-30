import RxSwift
import UIKit
import RxRelay
import RxCocoa

class SignUpViewModel {
    private let disposeBag = DisposeBag()
    private let model = SignUpModel()
    
    let email = BehaviorRelay<String>(value: "")
    let pass = BehaviorRelay<String>(value: "")
    let secPass = BehaviorRelay<String>(value: "")
    let status = BehaviorRelay<Bool>(value: false)
    
    init() {
        bindModel()
    }
    
    func bindModel() {
        model.status
            .bind(to: status)
            .disposed(by: disposeBag)
    }
    
    func getData() {
        model.getData(sEmail: email.value, sPass: pass.value, sSecPass: secPass.value)
    }
    
    func alertPres() -> UIAlertController {
        let alert = UIAlertController(title: "Ошибка", message: "Пароли не совпадают", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        return alert
    }
}
