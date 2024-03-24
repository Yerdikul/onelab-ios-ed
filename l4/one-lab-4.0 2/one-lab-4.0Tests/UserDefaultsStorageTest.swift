//
//  UserDefaultsStorageTest.swift
//  one-lab-4.0Tests
//
//  Created by Nurbolat Yerdikul on 17.03.2024.
//

import XCTest
@testable import one_lab_4_0

final class UserDefaultsStorageTest: XCTestCase {
    var userDefaultsManager: UserDefaultManager!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let userDefaults = UserDefaults(suiteName: "TestSuite")
        userDefaults?.removePersistentDomain(forName: "TestSuite")
        userDefaultsManager = UserDefaultManager(userDefaults: userDefaults!)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        userDefaultsManager.deleteAll()
        userDefaultsManager = nil
        super.tearDown()
    }

    func testSaveAndGetInt() {
        // Arrange
        let count = 10
        
        // Act
        userDefaultsManager.set(count, forKey: .appCount)
        
        // Assert
        XCTAssertEqual(userDefaultsManager.int(forKey: .appCount), 10, "The retrieved value should be equal to the saved value.")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            let array = Array(0...1000)
            var counter = 0
            array.forEach {
                counter += $0
            }
        }
    }

}
