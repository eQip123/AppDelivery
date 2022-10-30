import RxCocoa
import CoreData
import UIKit
import RxSwift
import RxRelay

class HistoryModel {
    let storage = OrderStorage.shared
    let list = BehaviorRelay<[Order]>(value: [])
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func getList() {
        list.accept(storage.historyOrders)
    }
    func getOrderList() {
        let request = NSFetchRequest<Order>(entityName: "Order")
        
        do {
            let orders = try context.fetch(request)
            
            list.accept(orders)
        } catch let err{
            print("Error get products \(err.localizedDescription)")
        }
    }
}
