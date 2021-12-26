//
//  EmployeesModel.swift
//  RxSwiftWithEmployeeList
//
//  Created by Mayar Adel on 11/22/21.
//

import Foundation

// MARK: - Employee
class EmployeesModel: Codable {
//    let status: String
    let data: [Employee]
//    let message: String
//
//    init(status: String, data: [Employee], message: String) {
//        self.status = status
//        self.data = data
//        self.message = message
//    }
}

// MARK: - Datum
class Employee: Codable {
    let id: Int
    let employeeName: String
    let employeeSalary, employeeAge: Int
    let profileImage: String

    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
//
//    init(id: Int, employeeName: String, employeeSalary: Int, employeeAge: Int, profileImage: String) {
//        self.id = id
//        self.employeeName = employeeName
//        self.employeeSalary = employeeSalary
//        self.employeeAge = employeeAge
//        self.profileImage = profileImage
//    }
}
