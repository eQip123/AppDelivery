import RxCocoa
import RxSwift
import RxRelay
import Foundation

class SignUpModel {
    
    private let userDefaults = UserDefaults.standard
    let status = BehaviorRelay<Bool>(value: false)
    
    func checkData(sEmail: String, sPass: String, sSecPass: String) {
        if sPass == sSecPass && sPass.isEmpty != true && sSecPass.isEmpty != true {
            userDefaults.setValue(sEmail, forKey: "email")
            userDefaults.setValue(sPass, forKey: "pass")
            status.accept(true)
        } else {
            status.accept(false)
        }
    }
    
    func getData(sEmail : String, sPass: String, sSecPass: String) {
        
        checkData(sEmail: sEmail, sPass: sPass, sSecPass: sSecPass)
        
    }
                                        
}
