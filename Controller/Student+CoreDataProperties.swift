//
//  Student+CoreDataProperties.swift
//  democore
//
//  Created by Kaushal Prajapati on 10/11/22.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var email: String?
    @NSManaged public var name: String?
    @NSManaged public var phone: String?
    @NSManaged public var universities: College?

}

extension Student : Identifiable {

}
