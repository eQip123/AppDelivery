import RxSwift
import UIKit
import RxCocoa
import RxRelay
import Foundation
import FirebaseAuth

class SignInModel {
    let savedEmail = BehaviorRelay<String>(value: "")
    let savedPass = BehaviorRelay<String>(value: "")
    let status = BehaviorRelay<Bool>(value: false)
    
    func updateSavedData() {
        savedEmail.accept(UserDefaults.standard.string(forKey: "email") ?? "")
        savedPass.accept(UserDefaults.standard.string(forKey: "pass") ?? "")
    }
    
    func alertModule() -> UIAlertController {
        
        let alert = UIAlertController(title: "Ошибка", message: "Неправильный логин или пароль", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        return alert
        
    }
    
    func canLogIn(sEmail: String, sPass: String){
        updateSavedData()
        Auth.auth().signIn(withEmail: sEmail, password: sPass) {[weak self] authResult, err in
            guard let strongSelf = self else {return}
            if let err = err {
                self!.status.accept(false)
                print(err.localizedDescription)
            }
            self!.status.accept(true)
        }
//        status.accept(true)
    }
}
