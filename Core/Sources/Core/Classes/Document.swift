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
        let cells = rowCells(at: Index(value: 0))
        DispatchQueue.thumbnail.async {
            // TODO: -
            var array = [UIImage]()
            for cell in cells {
                if let d = cell.pencil.data, let i = UIImage(data: d) {
                    array.append(i)
                }
                if let d = cell.paint.data, let i = UIImage(data: d) {
                    array.append(i)
                }
            }
            self.thumbnail = self.compositeImages(images: array)
            queue.async { block(self.thumbnail) }
        }
    }
    
#endif
    
    // MARK: -
    
#if os(macOS)
    
    // TODO: -
    
#endif
    
    // MARK: -
    
    private func rowCells(at index: Index) -> [Cell] {
        var result = [Cell]()
        for x in 0..<accessor.columns {
            let path = Path(x: x, y: index.value)
            if let cell = try? accessor.getCell(at: path) {
                result.append(cell)
            }
        }
        return result
    }
    
    func compositeImages(images: [UIImage]) -> UIImage? {
        var compositeImage: UIImage?
        if images.count > 0 {
            // Get the size of the first image.  This function assume all images are same size
            let size: CGSize = CGSize(width: images[0].size.width, height: images[0].size.height)
            UIGraphicsBeginImageContext(size)
            for image in images {
                let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
                image.draw(in: rect)
            }
            compositeImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        }
        return compositeImage
    }
}
