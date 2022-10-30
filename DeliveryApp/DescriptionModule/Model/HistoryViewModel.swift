import RxCocoa
import RxSwift
import RxRelay

class HistoryViewModel {
    let model = HistoryModel()
    let list = BehaviorRelay<[Order]>(value: [])
    private let disposeBag = DisposeBag()
    
    init() {
        binding()
        
    }
    
    func didGetList() {
        model.getList()
    }
    
    func binding() {
        model.list
            .bind(to: list)
            .disposed(by: disposeBag)
    }
    func saveOrder() {
        model.getOrderList()
    }
}
