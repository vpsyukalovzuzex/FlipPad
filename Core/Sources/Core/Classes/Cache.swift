//
// Cache.swift
//

import Foundation

public final class Cache<Key: Equatable, Value>: CustomStringConvertible {
    
    // MARK: -
    
    public var description: String {
        return "Cache keys: \(keys), values: \(values)"
    }
    
    // MARK: -
    
    private var keys: [Key]
    private var values: [Value]
    
    // MARK: -
    
    public init() {
        self.keys = []
        self.values = []
    }
    
    // MARK: -
    
    public func value(for key: Key) -> Value? {
        if let index = keys.firstIndex(of: key) {
            return values[index]
        }
        return nil
    }
    
    public func setValue(_ value: Value?, for key: Key) {
        if let index = keys.firstIndex(of: key) {
            keys.remove(at: index)
            values.remove(at: index)
        }
        if let value = value {
            keys.append(key)
            values.append(value)
        }
    }
    
    public func update(with block: (_ key: inout Key, _ value: inout Value) -> Void) {
        for key in keys {
            if let index = keys.firstIndex(of: key) {
                block(
                    &keys[index],
                    &values[index]
                )
            }
        }
    }
    
    public func removeAll() {
        keys.removeAll()
        values.removeAll()
    }
}
