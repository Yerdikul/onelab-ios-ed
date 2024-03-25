//
//  KeyValueStorage.swift
//  one-lab-4.0
//
//  Created by Nurbolat Yerdikul on 10.03.2024.
//

import Foundation

// CRUD

protocol KeyValueStorage {
    func set(_ object: Any?, forKey key: KeysStorage)
    func set<T: Encodable>(object: T?, forKey key: KeysStorage)
    func int(forKey key: KeysStorage) -> Int?
    
    func codableData<T: Decodable>(forKey key:  KeysStorage) -> T?
    func deleteAll()
}
public enum KeysStorage: String {
    case appCount
}

final class UserDefaultManager: KeyValueStorage {
    private let userDefaults: UserDefaults

    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }
    
    private func save(_ object: Any?, key: String) {
        DispatchQueue.global(qos: .userInteractive).async {
            self.userDefaults.set(object, forKey: key)
        }
    }
    
    private func get(key: String) -> Any? {
        userDefaults.object(forKey: key)
    }
    
    func set(_ object: Any?, forKey key: KeysStorage) {
        save(object, key: key.rawValue)
    }
    
    func set<T>(object: T?, forKey key: KeysStorage) where T : Encodable {
        let jsonData = try? JSONEncoder().encode(object)
        save(object, key: key.rawValue)
    }
    
    func codableData<T>(forKey key: KeysStorage) -> T? where T : Decodable {
        guard let data = get(key: key.rawValue) as? Data else {
            return nil
        }
        return try? JSONDecoder().decode(T.self, from: data)
    }
    
    func int(forKey key: KeysStorage) -> Int? {
        return get(key: key.rawValue) as? Int
    }
    
    func deleteAll() {
        
    }
}
