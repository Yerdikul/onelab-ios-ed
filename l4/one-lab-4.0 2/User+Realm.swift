//
//  User+CoreDataClass.swift
//  one-lab-4.0
//
//  Created by Nurbolat Yerdikul on 10.03.2024.
//
//

import Foundation
import RealmSwift

public class User: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted public var count: Int32
    @Persisted public var firstName: String?
    @Persisted public var lastName: String?
    
    convenience init(name: String, count: Int32) {
        self.init()
        self.firstName = name
        self.lastName = name
        self.count = count
    }
}
