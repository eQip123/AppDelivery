import RxSwift
import UIKit
import RxCocoa
import RxRelay
import Foundation
import FirebaseAuth

class SignInModel {
    let status = BehaviorRelay<Bool>(value: false)
    
    func alertModule() -> UIAlertController {
        
        let alert = UIAlertController(title: "Ошибка", message: "Неправильный логин или пароль", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        return alert
        
    }
    
    func canLogIn(sEmail: String, sPass: String){
        Auth.auth().signIn(withEmail: sEmail, password: sPass) {[weak self] authResult, err in
            guard let strongSelf = self else {return}
            if let err = err {
                print(err.localizedDescription)
            }
            
            if authResult != nil {
                self!.status.accept(true)
            } else {
                self!.status.accept(false)
            }
           
        }
    }
}
