//
//  User+CoreDataProperties.swift
//  one-lab-4.0
//
//  Created by Nurbolat Yerdikul on 10.03.2024.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var count: Int32
    @NSManaged public var id: UUID?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?

}

extension User : Identifiable {

}
