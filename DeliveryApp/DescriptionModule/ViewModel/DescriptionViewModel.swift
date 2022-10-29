import RxRelay
import RxSwift
import RxCocoa

class DescriptionViewModel {
    let disposeBag = DisposeBag()
    let model = DescriptionModel()
    let name = PublishRelay<String>()
    let fromWhere = PublishRelay<String>()
    let toWhere = PublishRelay<String>()
    let width = PublishRelay<String>()
    let height = PublishRelay<String>()
    let weight = PublishRelay<String>()
    let comment = PublishRelay<String>()
    
    init() {
        bindingModel()
    }
    
    func bindingModel() {
        model.name
            .bind(to: name)
            .disposed(by: disposeBag)

        model.fromWhere
            .bind(to: fromWhere)
            .disposed(by: disposeBag)

        model.toWhere
            .bind(to: toWhere)
            .disposed(by: disposeBag)

        model.width
            .bind(to: width)
            .disposed(by: disposeBag)

        model.height
            .bind(to: height)
            .disposed(by: disposeBag)

        model.weight
            .bind(to: weight)
            .disposed(by: disposeBag)

        model.comment
            .bind(to: comment)
            .disposed(by: disposeBag)
    }
    
    func getOrder() {
        model.getOrder()
    }
}
