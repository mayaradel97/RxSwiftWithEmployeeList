//
//  ViewController.swift
//  RxSwiftWithEmployeeList
//
//  Created by Mayar Adel on 11/22/21.
//

import UIKit
import RxSwift
import RxCocoa
class ViewController: UIViewController {
    @IBOutlet weak var employeeTableView: UITableView!
    let disposeBag = DisposeBag()
    let employeeVM = EmployeeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getEmployeesFromVM()
        self.bindToHiddenTable()
        self.subscribeToEmployeeArray()
        self.subscribeToSelectedRow()
    }
    func getEmployeesFromVM()
    {
        employeeVM.getEmployeesFromNetworkModel()
    }
    func bindToHiddenTable() {
        employeeVM.isTableHidden.bind(to: employeeTableView.rx.isHidden).disposed(by: disposeBag)
    }
    func subscribeToEmployeeArray()
    {
        employeeVM.employeesArrayObservable.bind(to: employeeTableView.rx.items(cellIdentifier: "employeeCell")){
            (row,employee,cell) in
            cell.textLabel?.text = employee.employeeName
            cell.detailTextLabel?.text =
                String(employee.employeeAge)
            
        }
        .disposed(by: disposeBag)
    }
    func subscribeToSelectedRow()  {
        Observable.zip(employeeTableView.rx.itemSelected, employeeTableView.rx.modelSelected(Employee.self))
            .bind { selectedIndex , employee in
                print(employee.employeeName)
                print(selectedIndex)
            
        }
            .disposed(by: disposeBag)
    }
}

