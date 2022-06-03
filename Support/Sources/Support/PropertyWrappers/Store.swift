//
// Store.swift
//

import Foundation

@propertyWrapper public struct Store<T: Codable> {
    
    // MARK: -
    
    private let key: String
    
    private let defaultValue: T
    
    private let suiteName: String?
    
    // MARK: -
    
    public var wrappedValue: T {
        get {
            return (try? userDefaults.get(T.self, key)) ?? defaultValue
        }
        set {
            try? userDefaults.set(newValue, key)
        }
    }
    
    // MARK: -
    
    private var userDefaults: UserDefaults {
        return UserDefaults(suiteName: suiteName) ?? .standard
    }
    
    // MARK: -
    
    public init(_ key: String, _ defaultValue: T, _ suiteName: String? = nil) {
        self.key = key
        self.defaultValue = defaultValue
        self.suiteName = suiteName
    }
}
