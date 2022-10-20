//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//  Generated using MVVM Module Generator by Mohamad Kaakati
//  https://github.com/Kaakati/MVVM-Template-Generator
//

import Foundation
import RxSwift
import RxCocoa

class ___VARIABLE_productName:identifier___ViewModel: APIRequestStateDelegate {
    enum Action {
        case didSelect(entity: ___VARIABLE_productName:identifier___Model)
    }
    let entity = BehaviorRelay<___VARIABLE_productName:identifier___Model?>(value: nil)
    let action = PublishSubject<Action?>()
    let isLoading = BehaviorRelay(value: false)
    let viewNeedsReload = PublishSubject<Bool>()
    private var disposeBag = DisposeBag()
    
    init() {
        action
            .asDriver(onErrorJustReturn: nil)
            .drive(onNext: { [weak self] action in
                guard let strongSelf = self else {
                    return
                }
                switch action {
                    case .didSelect(let entity):
                        strongSelf.entitySelected(entity)
                    default:
                        return

                }
            })
            .disposed(by: disposeBag)
    }
    
    func fetchData() {
        isLoading.accept(true)
        APIRequest<APIResponseDecodable<___VARIABLE_productName:identifier___Model>>(request: APIEndpoints.get___VARIABLE_productName:identifier___.request(), stateDelegate: self).rx.fetch()
            .subscribe(onNext: { [weak self] response in
                guard let strongSelf = self else {
                    return
                }
                strongSelf.entity.accept(response.value)
            })
            .disposed(by: disposeBag)
    }
    
    func entitySelected(_ entity: ___VARIABLE_productName:identifier___Model) {
        debugPrint("Did receive UI object", entity)
    }
    
    func requestStateChanged(_ request: any APIRequestProtocol, state: APIRequestState) {
        isLoading.accept(state == .fetching)
    }
}
