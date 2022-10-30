import RxSwift
import RxCocoa
import RxRelay

class ForgotViewModel {
    private let model = ForgotModel()
    private let disposeBag = DisposeBag()
    
    let email = BehaviorRelay<String>(value: "")
    let savedPass = BehaviorRelay<String>(value: "")
    let status = BehaviorRelay<Bool>(value: false)
    
    init() {
        bindModel()
    }
    
    func updateSavedData() {
        model.updateSavedData()
    }
    
    private func bindModel() {
        model.status
            .bind(to: status)
            .disposed(by: disposeBag)
        
        model.savedPass
            .bind(to: savedPass)
            .disposed(by: disposeBag)
    }
    
    func isCorrectEmail() {
        model.isCorrectEmail(sEmail: email.value)
    }
}
