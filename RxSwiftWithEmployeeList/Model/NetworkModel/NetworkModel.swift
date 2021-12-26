//
//  NetworkModel.swift
//  RxSwiftWithEmployeeList
//
//  Created by Mayar Adel on 11/22/21.
//

import Alamofire
import Foundation
class NetworkModel
{
    let employeeURL = "https://dummy.restapiexample.com/api/v1/employees"
    
    func getEmployeeFromAPI(completion: @escaping([Employee]?,Error?)->()){
        AF.request(employeeURL).validate()
            .responseDecodable(of: EmployeesModel.self) { (response) in
                switch response.result
                {
                case .failure(let error):
                    
                    print("error in network model \(error.localizedDescription)")
                    completion(nil,error)
                    
                case.success(let employeeModel):
                    print("data from network model \(employeeModel.data.count)")
                    completion(employeeModel.data,nil)
                    
                }
            }
        
    }
}
