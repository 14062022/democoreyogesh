//
//  College+CoreDataProperties.swift
//  democore
//
//  Created by Kaushal Prajapati on 10/11/22.
//
//

import Foundation
import CoreData


extension College {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<College> {
        return NSFetchRequest<College>(entityName: "College")
    }

    @NSManaged public var address: String?
    @NSManaged public var city: String?
    @NSManaged public var name: String?
    @NSManaged public var university: String?
    @NSManaged public var students: NSSet?

}

// MARK: Generated accessors for students
extension College {

    @objc(addStudentsObject:)
    @NSManaged public func addToStudents(_ value: Student)

    @objc(removeStudentsObject:)
    @NSManaged public func removeFromStudents(_ value: Student)

    @objc(addStudents:)
    @NSManaged public func addToStudents(_ values: NSSet)

    @objc(removeStudents:)
    @NSManaged public func removeFromStudents(_ values: NSSet)

}

extension College : Identifiable {

}
