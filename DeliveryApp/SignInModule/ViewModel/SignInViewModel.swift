import RxSwift
import UIKit
import RxRelay
import RxCocoa
import Foundation

class SignInViewModel {
    let disposeBag = DisposeBag()
    let model = SignInModel()
    
    let email = BehaviorRelay<String>(value: "")
    let pass = BehaviorRelay<String>(value: "")
    let savedEmail = BehaviorRelay<String>(value: "")
    let savedPass = BehaviorRelay<String>(value: "")
    let status = BehaviorRelay<Bool>(value: false)
    
    func getSavedData() {
        model.updateSavedData()
        savedEmail.accept(model.savedEmail.value)
        savedPass.accept(model.savedPass.value)
    }
    
    func alertModule() -> UIAlertController {
        let alert = UIAlertController(title: "Ошибка", message: "Неправильный логин или пароль", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        return alert
        
    }
    
    func canLogIn() {
        model.canLogIn(sEmail: email.value, sPass: pass.value)
        status.accept(model.status.value)
        print(model.status.value)
    }
}
