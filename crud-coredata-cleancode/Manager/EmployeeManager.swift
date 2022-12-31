//
//  EmployeeManager.swift
//  crud-coredata-cleancode
//
//  Created by Sarath P on 31/12/22.
//

import Foundation

class EmployeeManager {
    
    static let shared = EmployeeManager()
    private let _employeeRepository = EmployeeDataRepository()
    
    func create(employee: Employee) {
        _employeeRepository.create(employee: employee)
    }
    
    func getAllEmployee() -> [Employee]? {
        return _employeeRepository.getAllEmployee()
    }
    
    func get(byIdentifier id: UUID) -> Employee? {
        return _employeeRepository.get(byIdentifier: id)
    }
    
    func delete(employee record: Employee) -> Bool {
        return _employeeRepository.delete(employee: record)
    }
    
    func update(employee: Employee) -> Bool {
        return _employeeRepository.update(employee: employee)
    }
    
}
