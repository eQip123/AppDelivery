import RxCocoa
import RxSwift
import RxRelay

class MainViewModel {
    private let model = MainModel()
    private let disposeBag = DisposeBag()
    let list = BehaviorRelay<[Order]>(value: [])
    
    init() {
        bindingModel()
    }
    
    private func bindingModel() {
        model.list
            .bind(to: list)
            .disposed(by: disposeBag)
    }
    
    func didGetOrderList() {
        model.getOrderList()
    }
    
    func getOrder(name: String, fromWhere: String, toWhere: String, width: String, height: String, weight: String, comment: String) {
        model.getOrder(name: name, fromWhere: fromWhere, toWhere: toWhere, width: width, height: height, weight: weight, comment: comment)
    }
    
    func getOrdForHist(order: Order) {
        model.saveOrdHist(order: order)
    }
}
