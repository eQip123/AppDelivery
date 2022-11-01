import RxCocoa
import RxSwift
import RxRelay
import Foundation
import FirebaseAuth
import Firebase

class SignUpModel {
    
    let status = BehaviorRelay<Bool>(value: false)
    
    private func signUp(email: String, password: String, confirmPassword: String) {
        if password == confirmPassword && password.isEmpty != true && confirmPassword.isEmpty != true {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    print(error)
                }
            }
            status.accept(true)
        } else {
            status.accept(false)
        }
    }
    
    func getData(email : String, password: String, confirmPassword: String) {
        
        signUp(email: email, password: password, confirmPassword: confirmPassword)
        
    }
    
}
