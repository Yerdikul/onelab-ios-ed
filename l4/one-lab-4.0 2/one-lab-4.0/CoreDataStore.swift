//
//  CoreDataStore.swift
//  one-lab-4.0
//
//  Created by Nurbolat Yerdikul on 10.03.2024.
//

import UIKit
import CoreData

final class CoreDataStore {
    private let delegate = UIApplication.shared.delegate as? AppDelegate
    private lazy var context =  {
        delegate?.persistentContainer.viewContext
    }()
    
    func save(id: UUID, name: String, count: Int32) {
        guard let context else { return }
        guard let userDescription = NSEntityDescription.entity(forEntityName: "User", in: context) else { return }
        let user = User(entity: userDescription, insertInto: context)
        user.id = id
        user.firstName = name
        user.lastName = name
        user.count = count
        
        var counter = 0
        (0...10000).forEach {
            counter += $0
        }
        print(counter)
        self.delegate?.saveContext()
    }
    func fetchUser(name: String) -> User? {
        let request = NSFetchRequest<User>(entityName: "User")
        request.predicate = NSPredicate(format: "name = %@", name)
        do {
            return (try? context?.fetch(request).first as? User)
        }

    }
    func fetchAllUsers() -> [User]? {
        let request = NSFetchRequest<User>(entityName: "User")
        do {
            return (try? context?.fetch(request) as? [User] ?? [])
        }
    }
}

