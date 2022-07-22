//
// Document.swift
//

#if os(iOS)
import UIKit
#endif

#if os(macOS)
import Cocoa
#endif

public final class Document {
    
    // MARK: -
    
    public let url: URL
    
    // MARK: -
    
    private let accessor: FormatProtocol
    
    // MARK: -
    
    public var file: String {
        return url.lastPathComponent
    }
    
    public var name: String {
        return url.deletingPathExtension().lastPathComponent
    }
    
    // MARK: -
    
#if os(iOS)
    
    // MARK: -
    
    public var thumbnail: UIImage?
    
#endif
    
    // MARK: -
    
#if os(macOS)
    
    // TODO: -
    
#endif
    
    // MARK: -
    
    public init(url: URL) throws {
        self.url = url
        self.accessor = try FormatFactory.format(with: url)
    }
    
    // MARK: -
    
#if os(iOS)
    
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
    
#endif
    
    // MARK: -
    
#if os(macOS)
    
    // TODO: -
    
#endif
}
