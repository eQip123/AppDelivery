import RxSwift
import UIKit
import RxRelay
import RxCocoa

class SignUpViewModel {
    private let disposeBag = DisposeBag()
    private let model = SignUpModel()
    
    let email = BehaviorRelay<String>(value: "")
    let password = BehaviorRelay<String>(value: "")
    let confirmPassword = BehaviorRelay<String>(value: "")
    let status = BehaviorRelay<Bool>(value: false)
    
    init() {
        bindModel()
    }
    
    private func bindModel() {
        model.status
            .bind(to: status)
            .disposed(by: disposeBag)
    }
    
    func getData() {
        model.getData(email: email.value, password: password.value, confirmPassword: confirmPassword.value)
    }
    
    func alertPres() -> UIAlertController {
        let alert = UIAlertController(title: "Ошибка", message: "Пароли не совпадают", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        return alert
    }
}
