import RxSwift
import UIKit
import RxRelay
import RxCocoa

class SignUpViewModel {
    let disposeBag = DisposeBag()
    let model = SignUpModel()
    
    let email = BehaviorRelay<String>(value: "")
    let pass = BehaviorRelay<String>(value: "")
    let secPass = BehaviorRelay<String>(value: "")
    let status = BehaviorRelay<Bool>(value: false)
    
    init() {
        
    }
    
    func getData() {
        model.getData(sEmail: email.value, sPass: pass.value, sSecPass: secPass.value)
    }
    
    func alertPres() -> UIAlertController {
        let alert = UIAlertController(title: "Ошибка", message: "Пароли не совпадают", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        return alert
    }
    
    func checkData() {
        model.checkData(sEmail: email.value, sPass: pass.value, sSecPass: secPass.value)
        status.accept(model.status.value)
    }
}
