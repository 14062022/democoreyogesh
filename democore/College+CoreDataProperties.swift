//
//  College+CoreDataProperties.swift
//  democore
//
//  Created by Kaushal Prajapati on 29/10/22.
//
//

import Foundation
import CoreData


extension College {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<College> {
        return NSFetchRequest<College>(entityName: "College")
    }

    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var city: String?
    @NSManaged public var university: String?

}

extension College : Identifiable {

}
