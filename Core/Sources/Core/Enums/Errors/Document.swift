//
// Document.swift
//

import Foundation

public final class Document {
    
    // MARK: -
    
    public let url: URL
    
    // MARK: -
    
    public var name: String {
        return url.deletingPathExtension().lastPathComponent
    }
    
    // MARK: -
    
    public init(url: URL) {
        self.url = url
    }
}
