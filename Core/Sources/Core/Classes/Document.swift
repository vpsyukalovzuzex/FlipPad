//
// Document.swift
//

import UIKit

public final class Document {
    
    // MARK: -
    
    public let url: URL
    
    // MARK: -
    
    private let documentAccessor: DocumentAccessorProtocol
    
    // MARK: -
    
    public var file: String {
        return url.lastPathComponent
    }
    
    public var name: String {
        return url.deletingPathExtension().lastPathComponent
    }
    
    // MARK: -
    
    public var thumbnail: UIImage?
    
    // MARK: -
    
    public init(url: URL) throws {
        self.url = url
        self.documentAccessor = try DocumentAccessorFactory.documentAccessor(with: url)
    }
    
    // MARK: -
    
    public func generateThumbnail(on queue: DispatchQueue = .main, _ block: @escaping (_ thumbnail: UIImage?) -> Void) {
        if let thumbnail = thumbnail {
            queue.async { block(thumbnail) }
            return
        }
        DispatchQueue.thumbnail.async {
            // TODO: -
            queue.async { block(self.thumbnail) }
        }
    }
}
