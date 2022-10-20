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

protocol ___VARIABLE_productName:identifier___UIDelegate {
    func didCommit(action: ___VARIABLE_productName:identifier___ViewModel.Action)
}

class ___VARIABLE_productName:identifier___UI : UIView {
    var delegate: ___VARIABLE_productName:identifier___UIDelegate!
    
    var entity : [___VARIABLE_productName:identifier___Model]? {
        didSet {
            entityDidChange()
        }
    }
    var cellIdentifier = "___VARIABLE_productName:identifier___CellId"
    
    lazy var tableView : UITableView = {
        let tbl = UITableView()
        tbl.delegate = self
        tbl.dataSource = self
        tbl.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tbl.translatesAutoresizingMaskIntoConstraints = false
        return tbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setupConstraints()
    }
}

extension ___VARIABLE_productName:identifier___UI {

    private func setupUIElements() {
        // arrange subviews
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        // add constraints to subviews
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
}

extension ___VARIABLE_productName:identifier___UI: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entity?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = entity?[indexPath.row].name
        return cell
    }
}

extension ___VARIABLE_productName:identifier___UI: UITableViewDelegate {
    func entityDidChange() {
        tableView.reloadData()
    }

    func didCommit(action: ___VARIABLE_productName:identifier___ViewModel.Action) {
        delegate?.didCommit(action: action)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let entitySelected = entity?[indexPath.row] else {
            return
        }
        delegate?.didCommit(action: .didSelect(entity: entitySelected))
    }
    
}

