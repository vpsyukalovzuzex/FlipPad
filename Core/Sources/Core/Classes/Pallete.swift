//
// Pallete.swift
//

import Foundation

public final class Pallete {
    
    // MARK: -
    
    public let url: URL
    
    // MARK: -
    
    var palleteAccessor: PalleteAccessorProtocol
    
    // MARK: -
    
    public var colors: [Color] {
        return palleteAccessor.colors
    }
    
    // MARK: -
    
    public var file: String {
        return url.lastPathComponent
    }
    
    public var name: String {
        return url.deletingPathExtension().lastPathComponent
    }
    
    public var data: Data? {
        return palleteAccessor.data
    }
    
    // MARK: -
    
    public init(url: URL) throws {
        self.url = url
        self.palleteAccessor = try PalleteAccessorFactory.palleteAccessor(with: url)
    }
    
    // MARK: -
    
    public func addColor(_ color: Color) throws {
        palleteAccessor.colors.append(color)
        try data?.write(to: url)
    }
}
