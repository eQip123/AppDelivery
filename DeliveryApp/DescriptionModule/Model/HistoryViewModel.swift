import RxCocoa
import RxSwift
import RxRelay

class HistoryViewModel {
    let model = HistoryModel()
    let list = BehaviorRelay<[Order]>(value: [])
    let disposeBag = DisposeBag()
    
    init() {
        binding()
    }
    
    func binding() {
        model.list
            .bind(to: list)
            .disposed(by: disposeBag)
    }
}
