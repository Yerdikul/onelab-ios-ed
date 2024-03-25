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
    @Persisted public var count: Int32
    @Persisted public var id: UUID?
    @Persisted public var firstName: String?
    @Persisted public var lastName: String?
}

extension User : Identifiable {

}
