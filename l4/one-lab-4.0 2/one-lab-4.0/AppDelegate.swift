//
//  AppDelegate.swift
//  one-lab-4.0
//
//  Created by NYerdikul on 10.03.2024.
//

import UIKit
import CoreData
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization
        updateCount()
        return true
    }
    
    private func updateCount() {
        guard let userDefaults = UserDefaults(suiteName: "kz.one.lab") else { return }
        let manager = UserDefaultManager(userDefaults: userDefaults)
        var count = manager.int(forKey: .appCount) ?? 0
        count += 1
        
        manager.set(count, forKey: .appCount)
        print(manager.int(forKey: .appCount) ?? 0)
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
    // MARK: - Realm
    lazy var realm: Realm = {
        do {
            lazy var realm = try Realm()
        } catch {
            print("error")
        }
        return realm
    }()
    
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "one_lab_4_0")
        print(container.persistentStoreCoordinator.persistentStores.first?.url?.absoluteString ?? "")

        container.loadPersistentStores(completionHandler: { (storeDescription, error) in

            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

