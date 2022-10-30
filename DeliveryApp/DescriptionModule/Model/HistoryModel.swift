import RxCocoa
import RxSwift
import RxRelay

class HistoryModel {
    let storage = OrderStorage.shared
    let list = BehaviorRelay<[Order]>(value: [])
    
    func getList() {
        list.accept(storage.historyOrders)
    }
}
