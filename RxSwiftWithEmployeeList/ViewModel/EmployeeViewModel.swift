//
//  EmployeeViewModel.swift
//  RxSwiftWithEmployeeList
//
//  Created by Mayar Adel on 11/22/21.
//

import RxSwift
import RxCocoa
class EmployeeViewModel
{
    var isTableHidden = BehaviorRelay<Bool>(value: true)
   // var emplyeeDataSubject = PublishSubject<[Employee]>()
   private var emplyeeDataSubject = PublishSubject<[Employee]>()
    var employeesArrayObservable:Observable<[Employee]>{
        return emplyeeDataSubject
    }
    
    let networkModel = NetworkModel()
    
    func getEmployeesFromNetworkModel() {
        networkModel.getEmployeeFromAPI { [weak self]  (empolyee, error) in
            guard let self = self else {return}
            self.isTableHidden.accept(false)
            guard error == nil && empolyee != nil
            else
            {
                print("EmplyeeVM error getting data")
                return
                
            }
            print("vm \(empolyee!.count)")
            self.emplyeeDataSubject.onNext(empolyee!)
        }
        
    }
}
