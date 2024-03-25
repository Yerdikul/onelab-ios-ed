//
//  CoreDataStore.swift
//  one-lab-4.0
//
//  Created by Nurbolat Yerdikul on 10.03.2024.
//

import UIKit
import RealmSwift

final class RealmStore {
    private weak var delegate = UIApplication.shared.delegate as? AppDelegate
    private lazy var realm =  {
        delegate?.realm
    }()
    
    func save(name: String, count: Int32) {
        guard let realm = realm else {return}
        
        let user = User(name: name, count: count)
        
        try! realm.write {
            realm.add(user)
        }
    }
    
    func fetchUser(name: String) -> User? {
        
        let user = realm?.objects(User.self).where {
            $0.firstName == name
        }
        print("fetching via name \(user?.first)")
        print("fetching via name, no .first \(user)")

        return user?.first
    }
    
    func fetchAllUsers() -> [User]? {
        guard let users = realm?.objects(User.self) else { return nil }
        print("fetching all \(users)")
        return Array(users)
    }
}

