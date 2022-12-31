//
//  EmployeeDataRepository.swift
//  crud-coredata-cleancode
//
//  Created by Sarath P on 31/12/22.
//

import Foundation
import CoreData



protocol EmployeeRepository {
    func create(employee: Employee)
    func getAllEmployee() -> [Employee]?
    func get(byIdentifier id: UUID) -> Employee?
    func delete(employee record: Employee) -> Bool
    func update(employee: Employee) -> Bool
}


struct EmployeeDataRepository: EmployeeRepository {
    func create(employee: Employee) {
        let cdEmployee = CDEmployee(context: PersistentStorage.shared.context)
        cdEmployee.id = cdEmployee.id
        cdEmployee.name = employee.name
        cdEmployee.email = employee.email
        cdEmployee.avatarImg = employee.avatarImg
        
        PersistentStorage.shared.saveContext()
    }
    
    func getAllEmployee() -> [Employee]? {
        
        let result = PersistentStorage.shared.fetchManagedObjects(managerObject: CDEmployee.self)
        
        var employees: [Employee] = []
        
        result?.forEach({ cdEmployee in
            employees.append(cdEmployee.convertToEmployee())
        })
        
        return employees
    }
    
    func get(byIdentifier id: UUID) -> Employee? {
        guard let result = getCDEmployee(byIdentifier: id) else {return nil}
        return result.convertToEmployee()
    }
    
    func delete(employee record: Employee) -> Bool {
        guard let result = getCDEmployee(byIdentifier: record.id) else {return false}
        PersistentStorage.shared.context.delete(result)
        PersistentStorage.shared.saveContext()
        return true
    }
    
    func update(employee: Employee) -> Bool {
        guard let cdEmployee = getCDEmployee(byIdentifier: employee.id) else {return false}
        cdEmployee.email = employee.email
        cdEmployee.avatarImg = employee.avatarImg
        cdEmployee.name = employee.name
        
        PersistentStorage.shared.saveContext()
        return true
    }
    
    private func getCDEmployee(byIdentifier id: UUID) -> CDEmployee? {
        let fetchRequest = NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
        let predicate = NSPredicate(format: "id==%@", id as CVarArg)
        
        fetchRequest.predicate = predicate
        
        do {
            guard let result = try PersistentStorage.shared.context.fetch(fetchRequest).first else {return nil}
            return result
        } catch let error {
            print(error.localizedDescription)
        }
        return nil
    }
    
}
