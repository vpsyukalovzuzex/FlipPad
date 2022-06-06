//
// UserDefaults+Common.swift
//

import Foundation

public extension UserDefaults {
    
    // MARK: -
    
    func set<T>(_ object: T, _ key: String) throws where T: Encodable {
        let data = try JSONEncoder().encode(object)
        set(data, forKey: key)
    }
    
    func get<T>(_ type: T.Type, _ key: String) throws -> T? where T: Decodable {
        guard let data = data(forKey: key) else {
            return nil
        }
        return try JSONDecoder().decode(type.self, from: data)
    }
}
