//
//  CDEmployee+CoreDataProperties.swift
//  crud-coredata-cleancode
//
//  Created by Sarath P on 31/12/22.
//
//

import Foundation
import CoreData


extension CDEmployee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDEmployee> {
        return NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var email: String?
    @NSManaged public var name: String?
    @NSManaged public var avatarImg: Data?
    
    func convertToEmployee() -> Employee {
        return Employee(
            id: self.id ?? UUID(),
            name: self.name ?? "",
            email: self.email ?? "",
            avatarImg: self.avatarImg ?? Data()
        )
    }

}

extension CDEmployee : Identifiable {

}
