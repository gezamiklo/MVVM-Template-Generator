//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//  Generated using MVVM Module Generator by Mohamad Kaakati
//  https://github.com/Kaakati/MVVM-Template-Generator
//

import UIKit

protocol ___VARIABLE_productName:identifier___ViewProtocol {
    func viewWillPresent(entity: ___VARIABLE_productName:identifier___Model)
}

class ___VARIABLE_productName:identifier___View: UIViewController, ___VARIABLE_productName:identifier___ViewProtocol {
    
    private var ui = ___VARIABLE_productName:identifier___UI()
    var viewModel : ___VARIABLE_productName:identifier___ViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.fetchData()
    }
    
    override func loadView() {
        ui.delegate = self
        view = ui
    }
    
    func viewWillPresent(entity: ___VARIABLE_productName:identifier___Model) {
        ui.entity = entity
    }
}

extension ___VARIABLE_productName:identifier___View : ___VARIABLE_productName:identifier___UIDelegate {
    func didCommit(action: MyMVVMViewModel.Action) {
        viewModel.action.onNext(action)
    }
}
